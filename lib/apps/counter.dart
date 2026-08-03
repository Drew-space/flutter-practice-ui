import 'package:flutter/cupertino.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  void _increment() => setState(() => _count++);
  void _decrement() => setState(() => _count--);

  Widget _floatingButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: CupertinoColors.systemBlue,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: CupertinoColors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(50),
        onPressed: onPressed,
        child: Icon(icon, color: CupertinoColors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Counter')),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_count',
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _floatingButton(
                    icon: CupertinoIcons.minus,
                    onPressed: _decrement,
                  ),
                  const SizedBox(width: 24),
                  _floatingButton(
                    icon: CupertinoIcons.add,
                    onPressed: _increment,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CounterPage extends StatefulWidget {
//   const CounterPage({super.key});

//   @override
//   State<CounterPage> createState() => _CounterPageState();
// }

// class _CounterPageState extends State<CounterPage> {
//   int _count = 0;

//   void _increment() => setState(() => _count++);
//   void _decrement() => setState(() => _count--);

//   Widget _floatingButton({
//     required IconData icon,
//     required VoidCallback onPressed,
//   }) {
//     return Container(
//       width: 50,
//       height: 50,
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.circular(50),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 16,
//             offset: const Offset(0, 4),
//           ),
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 4,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(50),
//           onTap: onPressed,
//           child: Icon(icon, color: Colors.white),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter'),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 '$_count',
//                 style: const TextStyle(
//                   fontSize: 64,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 32),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _floatingButton(icon: Icons.remove, onPressed: _decrement),
//                   const SizedBox(width: 24),
//                   _floatingButton(icon: Icons.add, onPressed: _increment),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
