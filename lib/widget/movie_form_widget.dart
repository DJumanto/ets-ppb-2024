import 'package:flutter/material.dart';
class MovieFormWidget extends StatelessWidget {
  final String? image;
  final int? rating;
  final String? title;
  final String? description;
  final ValueChanged<int> onChangedRating;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedImage;

  MovieFormWidget({
    Key? key,
    this.image = '',
    this.rating = 0,
    this.title = '',
    this.description = '',
    required this.onChangedRating,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onChangedImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: (rating ?? 0).toDouble(),
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChanged: (rating) => onChangedRating(rating.toInt()),
                    ),
                  )
                ],
              ),
              buildTitle(),
              const SizedBox(height: 8),
              buildDescription(),
              const SizedBox(height: 8),
              buildImage(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedTitle,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: image,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedDescription,
      );
  
  Widget buildImage() => TextFormField(
        initialValue: description,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Import image url',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (image) => image != null && image.isEmpty
            ? 'The image url cannot be empty'
            : null,
        onChanged: onChangedImage,
      ); 
}
