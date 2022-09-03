part of home_view;

class _Drawer extends StatefulWidget {
  const _Drawer({super.key});

  @override
  State<_Drawer> createState() => __DrawerState();
}

class __DrawerState extends State<_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        //done
        child: Container(
          child: Column(
            children: [myDrawerList(context)],
          ),
        ),
      ),
    );
  }
}

Widget myDrawerList(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(
      top: 15,
    ),
    child: Column(
      children: [
        menuItem1(),
        menuItem2(),
        menuItem3(),
      ],
      //show the list of menu drawer
    ),
  );
}

Widget menuItem1() {
  return Material(
    child: InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                Icons.dashboard_outlined,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 3,
              child: IconButton(
                hoverColor: Colors.grey,
                onPressed: () {
                  {}
                },
                icon: Icon(
                  Get.isDarkMode
                      ? Icons.brightness_7_rounded
                      : Icons.nights_stay,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget menuItem2() {
  return Material(
    child: InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                Icons.bug_report,
                size: 20,
                color: Colors.red[500],
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "Report Bug",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget menuItem3() {
  return Material(
    child: InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                Icons.privacy_tip_outlined,
                size: 20,
                color: Colors.orangeAccent,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "Privacy Policy",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
