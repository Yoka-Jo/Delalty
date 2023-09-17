part of 'widgets.dart';

class ChatImage extends StatelessWidget {
  const ChatImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.w,
      height: 65.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: CachedImage(
              url:
                  'https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              fit: BoxFit.cover,
              width: 56.w,
              height: 56.w,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(1.r),
              height: 30.w,
              width: 30.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: const CachedImage(
                  url:
                      'https://images.pexels.com/photos/1103832/pexels-photo-1103832.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
