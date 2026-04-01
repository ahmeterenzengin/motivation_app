import 'dart:math'; 
import 'package:flutter/material.dart'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuoteScreen(),
    );
  }
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<String> quotes = [
    '"The only way to do great work is to love what you do."\n— Steve Jobs',
    '"Believe you can and you\'re halfway there."\n— Theodore Roosevelt',
    '"It does not matter how slowly you go as long as you do not stop."\n— Confucius',
    '"In the middle of every difficulty lies opportunity."\n— Albert Einstein',
    '"The secret of getting ahead is getting started."\n— Mark Twain',
    '"Don\'t watch the clock; do what it does. Keep going."\n— Sam Levenson',
    '"Act as if what you do makes a difference. It does."\n— William James',
    '"You are never too old to set another goal or to dream a new dream."\n— C.S. Lewis',
    '"Everything you\'ve ever wanted is on the other side of fear."\n— George Addair',
    '"Success is not final, failure is not fatal: it is the courage to continue that counts."\n— Winston Churchill',
  ];
  int currentIndex = 0;

  void changeQuote() {
    setState(() {
      currentIndex = Random().nextInt(quotes.length);
    });
  }

  void addQuote() {
    final text = _controller.text.trim();
    if (text.isEmpty) return; 

    setState(() {
      quotes.add(text);
      currentIndex = quotes.length - 1; 
    });
    _controller.clear(); 
  }

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6A11CB),
              Color(0xFF2575FC), 
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
            
              const Text(
                '✨ Motivate Your Day ✨',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 24),
            
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                   
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      
                      child: Text(
                        quotes[currentIndex],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          height: 1.5,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Type your own quote...',
                          hintStyle: TextStyle(
                            color: Colors.white.withValues(alpha: 0.6),
                          ),
                          filled: true,
                          fillColor: Colors.white.withValues(alpha: 0.15),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),                    
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: addQuote,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF6A11CB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              
              Padding(
                padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: changeQuote,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF6A11CB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'New Motivation',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
