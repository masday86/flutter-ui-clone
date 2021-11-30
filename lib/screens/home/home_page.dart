import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: titleAppbar(),
        actions: [iconAddPost(), iconFav(), iconChat()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [listStory(), firendPostList()],
        ),
      ),
    );
  }

  Widget titleAppbar() => const Text(
        'Instagram',
        style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 28,
            fontWeight: FontWeight.w400,
            color: Colors.black),
      );

  Widget iconAddPost() => IconButton(
      onPressed: () {},
      icon: const Icon(Icons.add_box_outlined, color: Colors.black));

  Widget iconFav() => IconButton(
      onPressed: () {},
      icon: const Icon(Icons.favorite_border, color: Colors.black));

  Widget iconChat() => IconButton(
      onPressed: () {},
      icon: const Icon(Icons.chat_outlined, color: Colors.black));

  Widget listStory() {
    return SizedBox(
      height: 110,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (c, i) => i == 0 ? addMyStory() : itemStory()),
    );
  }

  Widget addMyStory() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 72,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://media.istockphoto.com/photos/fit-man-standing-outdoors-in-a-city-picture-id1299360127?b=1&k=20&m=1299360127&s=170667a&w=0&h=1Rvw_UPTnj1LkB543cuCjiLM0xbIdjjin0rw6yaL8bc='),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          color: Colors.red),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.add_circle_outlined,
                        color: Colors.blue,
                        size: 16,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Your Story',
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      );

  Widget itemStory() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 72,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.pink)),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://us.123rf.com/450wm/tanutee/tanutee2005/tanutee200500005/148409909-flower-background-with-a-pastel-colored-for-graphic-design.jpg?ver=6'),
                          fit: BoxFit.fill),
                      shape: BoxShape.circle,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Friend Name',
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      );

  Widget firendPostList() => ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (c, i) => friednPostItem());

  Widget friednPostItem() => Column(
        children: [
          headerPost(),
          Image.network(
              'https://maritim.go.id/konten/unggahan/2016/01/GunungBromo3-1.jpg'),
          const SizedBox(height: 8),
          footerPost()
        ],
      );

  Widget headerPost() => Row(
        children: [
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.pink)),
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://us.123rf.com/450wm/tanutee/tanutee2005/tanutee200500005/148409909-flower-background-with-a-pastel-colored-for-graphic-design.jpg?ver=6'),
                      fit: BoxFit.fill),
                  shape: BoxShape.circle,
                  color: Colors.white),
            ),
          ),
          const SizedBox(width: 8),
          const Text('Account Name', style: TextStyle(color: Colors.black)),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 16,
              ))
        ],
      );

  Widget footerPost() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          postAction(),
          likeCount(),
          caption(),
          timePost(),
        ],
      );

  Widget postAction() => Row(
        children: const [
          SizedBox(width: 8),
          Icon(Icons.favorite_border_outlined, size: 24),
          SizedBox(width: 8),
          Icon(Icons.messenger_outline_rounded, size: 22),
          SizedBox(width: 8),
          Icon(Icons.send, size: 22),
          Spacer(),
          Icon(Icons.bookmark_outline_sharp, size: 24),
          SizedBox(width: 8),
        ],
      );

  Widget likeCount() => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('120 likes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      );

  Widget caption() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: RichText(
          text: const TextSpan(
            text: 'Account Name ',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: 'Caption this post',
                  style: TextStyle(fontWeight: FontWeight.normal)),
            ],
          ),
        ),
      );

  Widget timePost() => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '32 minutes ago',
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
      );
}
