// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:education_app_using_tdd/core/res/media_res.dart';
import 'package:equatable/equatable.dart';

class PageContent extends Equatable {
  final String image;
  final String title;
  final String description;
  const PageContent({
    required this.image,
    required this.title,
    required this.description,
  });
  const PageContent.first()
      : this(
          image: MediaRes.casualReading,
          title: 'Brand New curriculum',
          description:
              'This is worlds first online education platfrom designed by '
              "world's top Professors",
        );
  const PageContent.second()
      : this(
          image: MediaRes.casualLife,
          title: 'Brand a fun Atmosphere',
          description:
              'This is worlds first online education platfrom designed by '
              "world's top Professors",
        );
  const PageContent.third()
      : this(
          image: MediaRes.casualMeditation,
          title: 'Easy to join the lesson',
          description:
              'This is worlds first online education platfrom designed by '
              "world's top Professors",
        );
  @override
  // TODO: implement props
  List<Object?> get props => [image, title, description];
}
