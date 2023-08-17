part of 'widgets.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 370.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          scrollDirection: Axis.horizontal,
        ),
        items: List.generate(
          5,
          (index) => Image.network(
            'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            fit: BoxFit.cover,
          ),
        ).toList(),
      ),
    );
  }
}
