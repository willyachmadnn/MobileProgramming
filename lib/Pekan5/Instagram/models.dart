class UserProfile {
  final String username;
  final String profileImageUrl;
  final String bio;
  final String link;
  final int posts;
  final int followers;
  final int following;
  final List<Story> stories;
  final List<Post> posts_content;

  UserProfile({
    required this.username,
    required this.profileImageUrl,
    required this.bio,
    required this.link,
    required this.posts,
    required this.followers,
    required this.following,
    required this.stories,
    required this.posts_content,
  });

  static UserProfile dummyData() {
    return UserProfile(
      username: 'wladnn',
      profileImageUrl: 'assets/profile.jpg',
      bio: 'Blog Pribadi',
      link: 'MyLink',
      posts: 4,
      followers: 559,
      following: 288,
      stories: [
        Story(id: '1', imageUrl: 'assets/bgreels1.jpg', title: 'Mount'),
        Story(id: '2', imageUrl: 'assets/bgreels2.jpg', title: 'Hawa Dingin'),
      ],
      posts_content: [
        Post(id: '1', imageUrl: 'assets/postingan1.png'),
        Post(id: '2', imageUrl: 'assets/postingan2.png'),
        Post(id: '3', imageUrl: 'assets/postingan3.png'),
        Post(id: '4', imageUrl: 'assets/redi.png'),
      ],
    );
  }
}

class Story {
  final String id;
  final String imageUrl;
  final String title;

  Story({
    required this.id,
    required this.imageUrl,
    required this.title,
  });
}

class Post {
  final String id;
  final String imageUrl;

  Post({
    required this.id,
    required this.imageUrl,
  });
}