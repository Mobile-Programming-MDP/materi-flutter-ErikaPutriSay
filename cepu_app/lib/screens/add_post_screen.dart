import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController();
  String? _base64Image;
  String? _latitude;
  String? _longitude;
  String? _category;
  bool _isLoading = false;
  bool _isImageSelected = false;
  List<String> get categories {
    return [
      'Jalan Rusak',
      'Lampu jalan mati',
      'Lawan Arah',
      'Merokok di jalan',
      'Tidak Pakai helm',
    ];
  }

  //1.Fungsi pick, compress, dan convert image ke base64
  Future<void> _pickImageConvert() async {
    final ImagePicker picker = ImagePicker();
    final XFile image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _base64Image = base64Encode(bytes);
      });
    }
  }
}
