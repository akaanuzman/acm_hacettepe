class User {
  final String imageUrl;
  final String title;
  final String description;
  final String storyText;

  User({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.storyText,
  });

  factory User.fakeItem() => User(
        imageUrl: 'https://avatars.githubusercontent.com/u/55639112?v=4',
        title: 'Ahmet Kaan Uzman',
        description: 'Duzce University - Computer Engineering',
        storyText:
            '''"Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
             The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. 
             Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum"
             by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''' *
                5,
      );
}
