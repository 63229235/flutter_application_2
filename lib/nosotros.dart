import 'package:flutter/material.dart';

class MyAcerca extends StatefulWidget {
  const MyAcerca({super.key});

  @override
  State<MyAcerca> createState() => _MyAcercaState();
}

class _MyAcercaState extends State<MyAcerca> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Acerca de Nostros'),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 400,
                child: Center(
                  child: ElevatedButton(
                    child: const Text('Cerrar'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
