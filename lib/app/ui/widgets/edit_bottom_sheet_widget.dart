import 'package:flutter/material.dart';

class EditBottomSheetWidget extends StatelessWidget {
  final TextEditingController ctrl;
  final VoidCallback onEdit;

  const EditBottomSheetWidget({
    Key? key,
    required this.ctrl,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(20),
        color: const Color.fromARGB(255, 21, 57, 75),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: ctrl,
              decoration: const InputDecoration(hintText: 'Digite seu texto'),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 180,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  onEdit();
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  backgroundColor: const MaterialStatePropertyAll(
                    Color(0xFF44bd6e),
                  ),
                ),
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
