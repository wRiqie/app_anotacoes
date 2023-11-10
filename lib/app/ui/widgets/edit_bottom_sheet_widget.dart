import 'package:app_anotacoes/app/core/snackbars.dart';
import 'package:flutter/material.dart';

class EditBottomSheetWidget extends StatefulWidget {
  final String initialText;
  final Function(String value) onEdit;

  const EditBottomSheetWidget({
    Key? key,
    required this.initialText,
    required this.onEdit,
  }) : super(key: key);

  @override
  State<EditBottomSheetWidget> createState() => _EditBottomSheetWidgetState();
}

class _EditBottomSheetWidgetState extends State<EditBottomSheetWidget> {
  final editFocusNode = FocusNode();
  final editTextCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    editFocusNode.requestFocus();
    editTextCtrl.text = widget.initialText;
  }

  @override
  void dispose() {
    editTextCtrl.dispose();
    editFocusNode.dispose();
    super.dispose();
  }

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
              focusNode: editFocusNode,
              controller: editTextCtrl,
              decoration: const InputDecoration(hintText: 'Digite seu texto'),
              onSubmitted: (value) {
                _save(context);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 180,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  _save(context);
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

  void _save(BuildContext context) {
    if (editTextCtrl.text.trim().isEmpty) {
      AlertSnackbar(context,
          message: 'Por favor digite um texto para salvá-lo');
      editFocusNode.requestFocus();
      return;
    }

    widget.onEdit(editTextCtrl.text);
    Navigator.pop(context);
  }
}
