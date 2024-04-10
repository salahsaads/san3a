import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/info_model.dart';
import 'package:project/service/store_client.dart';

class Search extends StatefulWidget {
  int type;
  Search({super.key, required this.type});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isDark = false;
  String? search = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.h),
                  child: SearchAnchor(builder:
                      (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                      leading: const Icon(Icons.search),
                      trailing: <Widget>[
                        Tooltip(
                          message: 'Change brightness mode',
                          child: IconButton(
                            isSelected: isDark,
                            onPressed: () {
                              setState(() {
                                isDark = !isDark;
                              });
                            },
                            icon: const Icon(Icons.wb_sunny_outlined),
                            selectedIcon:
                                const Icon(Icons.brightness_2_outlined),
                          ),
                        )
                      ],
                    );
                  }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(9, (int index) {
                      List<String> items = [
                        'نجار',
                        'فني بوتجازات',
                        'فني غسالات',
                        'سباك',
                        'كهربائي',
                        'نقاش',
                        'فني تكيف',
                        'فني صيانه اطباق الدش',
                        'أخري'
                      ];

                      return ListTile(
                        title: Text(items[index]),
                        onTap: () {
                          setState(() {
                            search = items[index];
                            controller.closeView(items[index]);
                          });
                        },
                      );
                    });
                  })),
              All_workers(
                search: search,
                type: widget.type,
              ),
            ],
          ),
        ));
  }
}

class All_workers extends StatefulWidget {
  String? search;
  int type;
  All_workers({super.key, required this.search, required this.type});

  @override
  State<All_workers> createState() => _All_workersState();
}

class _All_workersState extends State<All_workers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildListView1(widget.type)],
        ),
      ),
    );
  }

  Widget _buildListView1(int type) {
    return FutureBuilder<List<Info_Model>>(
      future:
          FireStore_client().Get_Info_all_search(search: widget.search ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching data: ${snapshot.error}'));
        } else if (snapshot.data!.isNotEmpty) {
          List<Info_Model>? infoModels = snapshot.data;

          return YourGridViewWidget(
            infoModels: infoModels,
            type: type,
          );
        } else {
          return Text(
            'لا يوجود ورشه او صنيعي',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Marhey'),
          );
        }
      },
    );
  }
}

class YourGridViewWidget extends StatelessWidget {
  List<Info_Model>? infoModels;
  int type;
  YourGridViewWidget({super.key, required this.infoModels, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 15, // Spacing between columns
          mainAxisSpacing: 15, // Spacing between rows
          childAspectRatio:
              0.8, // Aspect ratio (width/height) of each grid item
        ),
        itemCount: infoModels?.length ?? 0,
        itemBuilder: (context, index) {
          Info_Model infoModel = infoModels![index];
          return GestureDetector(
            onDoubleTap: () {
              // Perform Firestore operation or any other actions
              FireStore_client().addUser_like1(
                fullName: infoModel.fullName!,
                location: infoModel.location!,
                work: infoModel.work!,
                email: infoModel.email!,
                url: infoModel.url ?? '',
                work_name: infoModel.workshop_name!,
                type: '1',
              );

              // Show SnackBar when double tapped
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text(
                    "❤️ تم الإضافة إلى المفضلات",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Marhey',
                    ),
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white, // Background color of each grid item
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image or placeholder widget
                  Container(
                    height: 90.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue, // Placeholder color if url is null
                      image: infoModel.url != null
                          ? DecorationImage(
                              image: NetworkImage(infoModel.url!),
                              fit: BoxFit.cover,
                            )
                          : null, // No image if url is null
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    type == 1
                        ? '${infoModel.fullName}'
                        : '${infoModel.workshop_name}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Marhey',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '${infoModel.work}',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Marhey',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '${infoModel.location}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Marhey',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star_border,
                        size: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        ': $title',
        style: TextStyle(
          color: main_color,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Marhey',
        ),
      ),
    );
  }
}
