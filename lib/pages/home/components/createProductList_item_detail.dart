import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../../../AppData.dart';
import '../../../Model/ModulList.dart';
import '../../../data/api/Depth.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';
import 'createModul_info_detail.dart';

class CreateProductListItemDetail extends StatefulWidget {
  const CreateProductListItemDetail({super.key});

  @override
  _CreateProductListItemDetailState createState() =>
      _CreateProductListItemDetailState();
}

class _CreateProductListItemDetailState
    extends State<CreateProductListItemDetail> with TickerProviderStateMixin {
  // bool _loading = false;
  List<ModulList> modulLists = [];
  List<ModulList> zorunluLists = [];
  bool Enable=true;

  final GlobalKey _draggableKey = GlobalKey();


  void _itemDroppedOnCustomerCart({
    required ModulList item,
    required Product product,
  }) {
    setState(() {
      product.items.add(item);
      AppData.Dragimageprovider = "";
      AppData.Dragimageyukseklik = 0;
      AppData.Dragimageyukseklik = product.formattedTotalItemheih;
      AppData.Dragimageprovider = product.ModulImage.toString();
      // AppData.Dragimageyukseklik = product.yukseklik;
      //  AppData.yukseklik =int.tryParse(source) product.formattedTotalItemheih;
      //  AppData.Zurunlu = product.ModulZerunlu.toString();
      AppData.namProductImagees.insert(0, AppData.Dragimageprovider);
      AppData.TotalUrunMaxYukseklik.insert(0, AppData.Dragimageyukseklik);

      AppData.modulLists = this.modulLists;
      GetTotalUrunMaxYukseklik();
      /* setState(() {

        AppData.TotalUrunMaxYukseklik =
            AppData.yuksekliktotal +
                AppData.yukseklikZorunluTrue;
        CreateModulInfoDetail(
            AppData.TotalUrunMaxYukseklik);
      });*/
    });
  }


  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    getModulList();
    GetTotalUrunMaxYukseklik();

  }

  List<Product> _Product = [
    Product(
      name: '',
      imageProvider: '',
    ),
  ];

  void getModulList() async {
    var depthhdata = AppData.depthhdata;
    var withhhdata = AppData.withhhdata;
    var language = AppData.language;
    int derinlik = depthhdata;
    int genislik = withhhdata;
    int dil = language;

    DepthApi.getCreateModulList(genislik, derinlik, dil).then((response) {
      setState(() {
        List data = jsonDecode(response.body);
        data.forEach((element) {
          Map obj = element;
          // bool success = obj['success'];
          List value = obj['value'];
          print(value);
          List value1 = value;
          this.modulLists = value1.map((e) => ModulList.fromJSON(e)).toList();
        });
        modulLists.length > 0 ? modulLists : show_massaje();
      });
    });
  }

  void gettest() async {
    setState(() {
      /*AppData.TotalUrunMaxYukseklik =
          AppData.yuksekliktotal + AppData.yukseklikZorunluTrue;
      print(AppData.TotalUrunMaxYukseklik);*/
    });
  }

  void GetTotalUrunMaxYukseklik() {
    AppData.TotalUrunMaxYukseklik.forEach((element) {
      print(element);
    });
    int sum = AppData.TotalUrunMaxYukseklik.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.yuksekliktotal = sum + AppData.yukseklikZorunluTrue;

    if (AppData.yuksekliktotal > AppData.maxyukseklik) {
      AppData.enablewidget = true;
    }
    else if(AppData.yuksekliktotal > AppData.maxyukseklik){
      AppData.enablewidget = false;
    }
    print("sum");
    print(sum);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: ScreenHelper(
          desktop: _buildUi(kDesktopMaxWidth),
          tablet: _buildUi(kTabletMaxWidth),
          mobile: _buildUi(getMobileMaxWidth(context)),
        ),
      ),
    );
  }

  @override
  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: CreateModulInfoDetail(AppData.yuksekliktotal),
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      child: Column(
                        children: [
                          _buildModulRow(),
                          _buildZorunluImage(),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      child: Column(
                        children: [
                          _buildModulList(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                Colors.orange.shade900, // foreground
                              ),
                              onPressed: () {
                                AppData.Zorumualanfalse = [];
                                AppData.Zorumualantrue = [];
                                AppData.namProductImagees = [];
                                AppData.TotalUrunMaxYukseklik = [];
                                AppData.Zorumualantrue = [];
                                AppData.modulLists = [];
                                AppData.enablewidget = false;
                                // AppData.TotalUrunMaxYukseklik.length=0;
                                // AppData.yukseklikZorunluTrue =0;
                                // AppData.yuksekliktotal=0;
                                // getMaxHeigh();

                                initState();
                              },
                              child: Text(
                                  " Listeyi Boşalt ve Yeniden Tasarla    ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0))),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildModulList() {
    var Zorumualanfalse = modulLists.where((item) => item.zorunlu == false);
    AppData.Zorumualanfalse = Zorumualanfalse.toList();

    return AbsorbPointer(
      absorbing: AppData.enablewidget,
      child: ListView.separated(
        // scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemCount: AppData.Zorumualanfalse.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12.0,
          );
        },
        itemBuilder: (context, index) {
          final item = AppData.Zorumualanfalse[index];
          return _buildModulItem(
            item: item,
          );
        },
      ),
    );
  }

  //longpreess ro be drag tabdil kardam

  Widget _buildModulItem({
    required ModulList item,
  }) {
    return Draggable<ModulList>(
        data: item,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: DraggingListItem(
            dragKey: _draggableKey,
            photoProvider: item.resim.toString(),
            yukseklik: item.yukseklik),
        child: ModulListItem(
          name: item.moduladi,
          yukseklik: item.yukseklik,
          //price: item.formattedTotalItemPrice,
          photoProvider: item.resim.toString(),
        ));
  }

  Widget _buildModulRow() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 20.0,
        ),
        child: Row(
          children: _Product.map(_buildModulWithDropZone).toList(),
        ),
      ),
    );
  }

  Widget _buildModulWithDropZone(Product product) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
        ),
        child: DragTarget<ModulList>(
          builder: (context, candidateItems, rejectedItems) {
            return ModulCart(
              hasItems: product.items.isNotEmpty,
              highlighted: candidateItems.isNotEmpty,
              product: product,
              function: methodInParent,
            );
          },
          onAccept: (item) {
            _itemDroppedOnCustomerCart(
              item: item,
              product: product,
            );
          },
        ),
      ),
    );
  }

  methodInParent() {
    setState(() {
      initState();
    });
  }
  show_massaje() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Veri Bulunamadı'),
    ));
  }

  Widget _buildZorunluImage() {
    var Zorumualantrue =
    AppData.modulLists.where((item) => item.zorunlu == true);
    AppData.Zorumualantrue = Zorumualantrue.toList();
    return Container(
      child: Column(
        children: List.generate(AppData.Zorumualantrue.length, (index) {
          AppData.yukseklikZorunluTrue =
              AppData.Zorumualantrue[index].yukseklik;
          return Visibility(
            visible: false,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
              elevation: 0,
              child: ListTile(
                title: Image.network(
                  AppData.Zorumualantrue[index].resim.toString(),
                  scale: 1,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}


class ModulCart extends StatefulWidget {
  const ModulCart({
    super.key,
    required this.product,
    this.highlighted = false,
    this.hasItems = false,
    required this.function,
  });

  final Product product;
  final bool highlighted;
  final bool hasItems;
  final VoidCallback function;

  @override
  State<ModulCart> createState() => _ModulCartState();
}

class _ModulCartState extends State<ModulCart> {
//// gesmat payin afrad ra namayesh midahad
  @override
  Widget build(BuildContext context) {
    return Center(

      child: Transform.scale(

        scale: widget.highlighted ? 1.075 : 1.0,
        child: Material(
          elevation: widget.highlighted ? 8.0 : 4.0,
          borderRadius: BorderRadius.circular(19.0),
          color: widget.highlighted ? const Color(0xFFF64209) : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 24.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //test2(),
                Visibility(
                  visible: widget.hasItems,
                  maintainState: true,
                  maintainAnimation: true,
                  maintainSize: true,
                  child: Column(
                    children: [
                      Center(
                        child: Expanded(
                          child: AbsorbPointer(
                            absorbing: false,
                            child: ReorderableListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: AppData.namProductImagees.length,
                                itemBuilder: (BuildContext context, int index) {

                                    return Container(
                                      key: ValueKey(index),
                                      color: Colors.grey.shade50,
                                      // margin: const EdgeInsets.all(0),
                                      child: ListTile(
                                        title: Image.network(
                                            AppData.namProductImagees[index],
                                            scale: 1),
                                        trailing: IconButton(
                                          icon: Icon(
                                              Icons.accessibility_new_outlined,
                                              color: Colors.black),
                                          onPressed: () {
                                            setState(() {
                                              AppData.namProductImagees
                                                  .removeAt(index);
                                              AppData.TotalUrunMaxYukseklik
                                                  .removeAt(index);
                                              int sum = AppData
                                                  .TotalUrunMaxYukseklik
                                                  .fold(
                                                  0,
                                                      (previousValue, element) =>
                                                  previousValue +
                                                      element);
                                              AppData.yuksekliktotal = sum +
                                                  AppData.yukseklikZorunluTrue;
                                              print(AppData.yuksekliktotal);
                                              print("AppData.yuksekliktotal");

                                              if (AppData.yuksekliktotal <
                                                  AppData.maxyukseklik) {
                                                AppData.enablewidget = false;
                                                // model.visible = false;
                                                print(AppData.yuksekliktotal);
                                                widget.function();
                                                CreateModulInfoDetail;
                                                CreateProductListItemDetail;
                                                /* initState();
                                                setState(() {
                                                  CreateProductListItemDetail();
                                                  CreateModulInfoDetail();
                                                });*/

                                              }
                                            });
                                          },
                                        ),

                                        //  leading: Text(product.formattedTotalItemheih.toString()),
                                        /* Do something else */
                                      ),

                                  );
                                },
                                // The reorder function
                                onReorder: (oldIndex, newIndex) {
                                  if (newIndex > oldIndex) {
                                    newIndex = newIndex - 1;
                                  }
                                  final element =
                                  AppData.namProductImagees.removeAt(oldIndex);
                                  AppData.namProductImagees
                                      .insert(newIndex, element);
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: ListTile(
                      title: Image.network(
                        AppData.Zurunluresim.toString() == ""
                            ? "http://sistemonline.com.tr/seowood/28-68-1.png"
                            : AppData.Zurunluresim.toString(),
                        scale: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildZorunluImage() {
    var Zorumualantrue =
    AppData.modulLists.where((item) => item.zorunlu == true);
    AppData.Zorumualantrue = Zorumualantrue.toList();
    return Container(
      child: Column(
        children: List.generate(AppData.Zorumualantrue.length, (index) {
          AppData.yukseklikZorunluTrue =
              AppData.Zorumualantrue[index].yukseklik;
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
            elevation: 0,
            child: ListTile(
              title: Image.network(
                AppData.Zorumualantrue[index].resim.toString(),
                scale: 1,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ModulListItem extends StatelessWidget {
  const ModulListItem({
    super.key,
    this.name = '',
    required this.photoProvider,
    required this.yukseklik,
    this.isDepressed = false,
  });

  final String name;
  final String photoProvider;
  final int yukseklik;
  final bool isDepressed;

//// gesmat bala menu gazaha
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(0),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Center(
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 0),
                        curve: Curves.easeInOut,
                        height: isDepressed ? 300 : 300,
                        width: isDepressed ? 300 : 300,
                        child: Image.network(photoProvider, scale: 1)),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    super.key,
    required this.dragKey,
    required this.photoProvider,
    required this.yukseklik,
  });

  final GlobalKey dragKey;
  final String photoProvider;
  final int yukseklik;

  ///// aksi ke drag mishavad ra namayesh midahad

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Opacity(
              opacity: 0.85, child: Image.network(photoProvider, scale: 1)),
        ),
      ),
    );
  }
}

class Item {
  const Item({
    required this.TotalItemheih,
    required this.name,
    required this.uid,
    required this.imageProvider,
  });

  final int TotalItemheih;
  final String name;
  final String uid;
  final String imageProvider;
}

class Product {
  Product({
    required this.name,
    required this.imageProvider,
    List<ModulList>? items,
  }) : items = items ?? [];

  final String name;
  final String imageProvider;
  final List<ModulList> items;

  String get ModulImage {
    final imageprovider =
    items.fold<String>('', (prev, item) => item.resim.toString());
    return imageprovider;
  }

  int get formattedTotalItemheih {
    final TotalItemheih = items.fold<int>(0, (prev, item) => item.yukseklik);
    return TotalItemheih;
  }
}
