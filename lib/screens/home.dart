import 'package:flutter/material.dart';
import 'package:week7/screens/chat.dart';
import 'package:week7/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = [    
    'Adam',
    'Tony',
    'John',
    'Sunny',
    'Tom',
    'Tison',
    'James',
    'Roshan',
    'Jerry',
    'Stephen',
      ];
  var images = [    
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw3NjA4Mjc3NHx8ZW58MHx8fHw%3D&w=1000&q=80',
    'https://static01.nyt.com/images/2021/03/31/obituaries/18Mileti/18Mileti-mediumSquareAt3X.jpg',
    'https://s.yimg.com/ny/api/res/1.2/c7w6TdHI3BYNnu9WWAKnYA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTQyMDtoPTQyMA--/https://media.zenfs.com/en/accesswire.ca/954833691740538954f5e5ccc8f721c7',
    'https://hips.hearstapps.com/hmg-prod/images/tyler-henry-reading-hollywood-medium-1551978559.jpg?crop=0.718xw:0.478xh;0.00979xw,0.0608xh&resize=1200:*',
    'https://images.ctfassets.net/1wryd5vd9xez/4DxzhQY7WFsbtTkoYntq23/a4a04701649e92a929010a6a860b66bf/https___cdn-images-1.medium.com_max_2000_1_Y6l_FDhxOI1AhjL56dHh8g.jpeg',
    'https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3BK3YaxpwxtHGmNzav7cd__bPo3sTrLBFQGo1P7lvGLdQoayZjfdnOI_o9S7i9s1dQ1c&usqp=CAU',
    'https://s.yimg.com/ny/api/res/1.2/UcfQ30F83ue0rCRcHlATnA--/YXBwaWQ9aGlnaGxhbmRlcjt3PTQyMDtoPTQyMA--/https://media.zenfs.com/en/accesswire.ca/83da1fa22452806a8736437631dd7434',
    'https://pbs.twimg.com/profile_images/1591183669955162112/nYKtxGyN_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1639291580254224384/8tgfncBu_400x400.jpg',
     ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 230, 240, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(33, 110, 199, 1),
        title: const Text('Telegram'),
        actions: [
          IconButton(
            onPressed: () async {
              var pref = await SharedPreferences.getInstance();
              pref.setBool('isLogged', false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.grey,
                  margin: EdgeInsets.all(10),
                  content: Text('You logged out'),
                ),
        );
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => chat(
                        name: name[index],
                        image: images[index],
                      ),
                    ),
                  );
                },
                leading: (index)%3==0
                    ? CircleAvatar(
                        radius: 35,
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        backgroundImage: NetworkImage(
                          images[index],
                        ),
                      )
                    : Image(
                        width: 70,
                        image: NetworkImage(
                          images[index],
                        ),
                      ),
                title: Text(
                  name[index],
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text('you have a message'),
                trailing: Text('2:00 pm'),
          
              );
            },
            // separatorBuilder: (context, index) {
            //   return const Divider(
            //     thickness: 1,
            //     color: Color.fromRGBO(0, 0, 0, 1),
            //   );
            // },
            itemCount: name.length),
      ),
    );
  }
}