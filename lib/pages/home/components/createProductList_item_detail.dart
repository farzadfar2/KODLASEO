import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../AppData.dart';
import '../../../Model/ModulList.dart';
import '../../../data/api/Depth.dart';

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

  final GlobalKey _draggableKey = GlobalKey();

  void _itemDroppedOnCustomerCart({
    required ModulList item,
    required Product product,
  }) {
    setState(() {
      product.items.add(item);
      AppData.Dragimageprovider = "";
      AppData.Dragimageprovider = product.ModulImage.toString();
      AppData.Zurunlu = product.ModulZerunlu.toString();
      AppData.namProductImagees.insert(0, AppData.Dragimageprovider);
      AppData.modulLists = this.modulLists;
    });
  }

  @override
  void initState() {
    getModulList();
    data();
  }

  List<Product> _Product = [
    Product(name: '', imageProvider: ''),
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: _buildModulRow(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                            initState();
                          },
                          child: Text(" Listeyi Boşalt ve Yeniden Tasarla    ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16.0)))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModulList() {
    var Zorumualanfalse = modulLists.where((item) => item.zorunlu == false);
    AppData.Zorumualanfalse = Zorumualanfalse.toList();

    var Zorumualantrue = modulLists.where((item) => item.zorunlu == true);
    AppData.Zorumualantrue = Zorumualantrue.toList();

    dynamic getListMap(List<dynamic> items) {
      if (items == null) {
        return null;
      }
      List<Map<String, dynamic>> list = [];
      items.forEach((element) {
        list.add(element.toMap());
      });
      print(list);
      return list;
    }

    print("Zorumualantrue");
    print(getListMap);
    print(AppData.Zorumualantrue.length);
    print("Zorumualantrue");

    return ListView.separated(
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
    );
  }

  Widget _buildModulItem({
    required ModulList item,
  }) {
    return LongPressDraggable<ModulList>(
        data: item,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: DraggingListItem(
          dragKey: _draggableKey,
          photoProvider: item.resim.toString(),
        ),
        child: ModulListItem(
          name: item.moduladi,
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

  show_massaje() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Veri Bulunamadı'),
    ));
  }

  void data() {
    /*  var Zorumualantrue = modulLists.where((item) => item.zorunlu == false);
    AppData.Zorumualantrue= Zorumualantrue.toList();
   print("Zorumualantrue");
   print(AppData.Zorumualantrue.length);
   print("Zorumualantrue")*/
    ;
    /* Iterable result = AppData.Zorumualantrue.where((item) => item.resim);
    //
    print("Zorumualantrue");
    print(result.length);
    print("Zorumualantrue");
*/
  }
}

class ModulCart extends StatelessWidget {
  const ModulCart({
    super.key,
    required this.product,
    this.highlighted = false,
    this.hasItems = false,
  });

  final Product product;
  final bool highlighted;
  final bool hasItems;

//// gesmat payin afrad ra namayesh midahad
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: highlighted ? 1.075 : 1.0,
      child: Material(
        elevation: highlighted ? 8.0 : 4.0,
        borderRadius: BorderRadius.circular(19.0),
        color: highlighted ? const Color(0xFFF64209) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //test2(),

              Visibility(
                visible: hasItems,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: Column(
                  children: [
                    Center(
                      child: Expanded(
                        child: ReorderableListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: AppData.namProductImagees.length,
                            itemBuilder: (BuildContext context, int index) {
                              // final String productName = AppData.namProductImagees[index];
                              return Card(
                                elevation: 0,
                                key: ValueKey(index),
                                //   color: Colors.grey.shade50,
                                // margin: const EdgeInsets.all(0),
                                child: ListTile(
                                  title: Image.network(
                                      AppData.namProductImagees[index],
                                      scale: 1),
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
                  ],
                ),
              ),
              Image.network(
                "http://sistemonline.com.tr/seowood/28-68-1.png",
                width: 276,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModulListItem extends StatelessWidget {
  const ModulListItem({
    super.key,
    this.name = '',
    required this.photoProvider,
    this.isDepressed = false,
  });

  final String name;
  final String photoProvider;
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
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
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
                        duration: const Duration(milliseconds: 50),
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
  });

  final GlobalKey dragKey;
  final String photoProvider;

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

  String get ModulZerunlu {
    final zorunlu =
        items.fold<String>('', (prev, item) => item.zorunlu.toString());
    return zorunlu;
  }
}
