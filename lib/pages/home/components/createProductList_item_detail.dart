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
  bool Enable = true;

  final GlobalKey _draggableKey = GlobalKey();

  void _itemDroppedOnCustomerCart({
    required ModulList item,
    required Product product,
  }) {
    setState(() {
      product.items.add(item);
      AppData.Dragimageprovider = "";
      AppData.Dragimageyukseklik = 0;
      AppData.agrlkiktotal = 0;
      AppData.fiyattotal = 0;
      AppData.desitotal = 0;
      AppData.modulId = 0;
      AppData.Dragimageyukseklik = product.formattedTotalItemheih;
      AppData.Dragimageprovider = product.ModulImage.toString();
      AppData.agrlkiktotal = product.formattedTotalItemweight;
      AppData.fiyattotal = product.formattedTotalItemPrice;
      AppData.desitotal = product.formattedTotalItemDesi;
      AppData.modulId = product.ModulIdList;
      AppData.namProductImagees.insert(0, AppData.Dragimageprovider);
      AppData.TotalUrunMaxYukseklik.insert(0, AppData.Dragimageyukseklik);
      AppData.TotalUrunagrlik.insert(0, AppData.agrlkiktotal);
      AppData.TotalUrunfiyat.insert(0, AppData.fiyattotal);
      AppData.TotalUrunDesi.insert(0, AppData.desitotal);
      AppData.ModulListId.insert(0, AppData.modulId);

      AppData.modulLists = this.modulLists;
      GetTotalUrunMaxYukseklik();
      GetTotalaWeigt();
      GetTotalfiyat();
    });
  }

  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    getModulList();
    GetTotalUrunMaxYukseklik();
    GetTotalaWeigt();
    GetTotalfiyat();
    GetTotalDesi();
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
    String doviz = AppData.doviz;
    print("doviz");
    print(doviz);
    DepthApi.getCreateModulList(genislik, derinlik, dil, doviz)
        .then((response) {
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
    setState(() {});
  }

  void GetTotalDesi() {
    AppData.TotalUrunDesi.forEach((element) {
      print(element);
    });
    double sum = AppData.TotalUrunDesi.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.desitotal = sum + AppData.fiyatZorunluTrue;
  }

  void GetTotalfiyat() {
    AppData.TotalUrunfiyat.forEach((element) {
      print(element);
    });
    double sum = AppData.TotalUrunfiyat.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.fiyattotal = sum + AppData.fiyatZorunluTrue;
  }

  void GetTotalaWeigt() {
    AppData.TotalUrunagrlik.forEach((element) {
      print(element);
    });
    int sum = AppData.TotalUrunagrlik.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.agrlkiktotal = sum + AppData.AgrlikZorunluTrue;
  }

  void GetTotalUrunMaxYukseklik() {
    AppData.TotalUrunMaxYukseklik.forEach((element) {
      print(element);
    });
    int sum = AppData.TotalUrunMaxYukseklik.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.yuksekliktotal = sum + AppData.yukseklikZorunluTrue;

    if (AppData.yuksekliktotal > AppData.maxyukseklik) {
      show_massaje();
      AppData.enablewidget = true;
    } else if (AppData.yuksekliktotal > AppData.maxyukseklik) {
      AppData.enablewidget = false;
    }
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
                  child: CreateModulInfoDetail(),
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
                                  Colors.orange.shade700, // foreground
                              ),
                              onPressed: () {
                                AppData.Zorumualanfalse = [];
                                AppData.Zorumualantrue = [];
                                AppData.namProductImagees = [];
                                AppData.TotalUrunMaxYukseklik = [];
                                AppData.TotalUrunagrlik = [];
                                AppData.TotalUrunfiyat = [];
                                AppData.TotalUrunDesi = [];
                                AppData.ModulListId = [];

                                AppData.Zorumualantrue = [];
                                AppData.modulLists = [];
                                AppData.enablewidget = false;
                                getModulList();
                                GetTotalUrunMaxYukseklik();
                                GetTotalaWeigt();
                                GetTotalfiyat();
                                GetTotalDesi();
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
            yukseklik: item.yukseklik,
            agrlik: item.agirlik,
            kutudesi: item.kutudesi,
            modulaciklama: item.modulaciklama,
            fiyat: item.fiyat),
        child: ModulListItem(
          name: item.modulaciklama,
          modulaciklama: item.moduladi,
          yukseklik: item.yukseklik,
          agrlik: item.agirlik,
          fiyat: item.fiyat,
          kutudesi: item.kutudesi,
          photoProvider: item.resim.toString(),
        ));
  }

  Widget _buildModulRow() {
    return  Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 20.0,
        ),
        child: Row(
          children: _Product.map(_buildModulWithDropZone).toList(),
        ),

    );
  }

  Widget _buildModulWithDropZone(Product product) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
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
          AppData.AgrlikZorunluTrue = AppData.Zorumualantrue[index].agirlik;
          AppData.fiyatZorunluTrue = AppData.Zorumualantrue[index].fiyat;
          AppData.desiZorunluTrue = AppData.Zorumualantrue[index].fiyat;
          AppData.IdZorunluTrue = AppData.Zorumualantrue[index].id;
          AppData.modulaciklama = AppData.Zorumualantrue[index].modulaciklama;

          return Visibility(
            visible: false,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              elevation: 0,
              child: ListTile(
                title: Image.network(
                  AppData.Zorumualantrue[index].resim.toString(),
                  scale: 1,
                ),
                subtitle:
                    Text(AppData.Zorumualantrue[index].agirlik.toString()),
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
    return  Center(
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
                        const SizedBox(height: 4.0),
                        SingleChildScrollView(
                        child:  AbsorbPointer(
                            absorbing: false,
                          child: Column(
                            children: [


                              ReorderableListView.builder(
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
                                              AppData.TotalUrunagrlik.removeAt(
                                                  index);
                                              AppData.TotalUrunfiyat.removeAt(
                                                  index);
                                              AppData.TotalUrunDesi.removeAt(
                                                  index);
                                              AppData.ModulListId.removeAt(index);

                                              double sumdesi =
                                                  AppData.TotalUrunDesi.fold(
                                                      0,
                                                      (previousValue, element) =>
                                                          previousValue +
                                                          element);
                                              AppData.desitotal = sumdesi +
                                                  AppData.desiZorunluTrue;

                                              double sumfiyat =
                                                  AppData.TotalUrunfiyat.fold(
                                                      0,
                                                      (previousValue, element) =>
                                                          previousValue +
                                                          element);
                                              AppData.fiyattotal = sumfiyat +
                                                  AppData.fiyatZorunluTrue;

                                              int sumagrlik =
                                                  AppData.TotalUrunagrlik.fold(
                                                      0,
                                                      (previousValue, element) =>
                                                          previousValue +
                                                          element);
                                              AppData.agrlkiktotal = sumagrlik +
                                                  AppData.AgrlikZorunluTrue;

                                              AppData.agrlkiktotal = sumagrlik +
                                                  AppData.AgrlikZorunluTrue;
                                              int sumyukseklik = AppData
                                                      .TotalUrunMaxYukseklik
                                                  .fold(
                                                      0,
                                                      (previousValue, element) =>
                                                          previousValue +
                                                          element);

                                              AppData.yuksekliktotal =
                                                  sumyukseklik +
                                                      AppData
                                                          .yukseklikZorunluTrue;
                                              if (AppData.yuksekliktotal <
                                                  AppData.maxyukseklik) {
                                                AppData.enablewidget = false;
                                                widget.function();
                                                CreateModulInfoDetail;
                                                CreateProductListItemDetail;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  // The reorder function
                                  onReorder: (oldIndex, newIndex) {
                                    if (newIndex > oldIndex) {
                                      newIndex = newIndex - 1;
                                    }
                                    final element = AppData.namProductImagees
                                        .removeAt(oldIndex);
                                    final element2 =
                                        AppData.ModulListId.removeAt(oldIndex);
                                    AppData.namProductImagees
                                        .insert(newIndex, element);
                                    AppData.ModulListId.insert(
                                        newIndex, element2);
                                  }),
                            ],
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
}

class ModulListItem extends StatelessWidget {
  const ModulListItem({
    super.key,
    this.name = '',
    required this.photoProvider,
    required this.modulaciklama,
    required this.yukseklik,
    required this.agrlik,
    required this.fiyat,
    required this.kutudesi,
    this.isDepressed = false,
  });

  final String name;
  final String photoProvider;
  final String modulaciklama;
  final int yukseklik;
  final int agrlik;
  final double fiyat;
  final double kutudesi;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade700,
                        border: Border.all(
                          color: Colors.orange.shade700,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          name,
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    fontSize: 14.0,color: Colors.white
                                  ),
                        ),
                      ),
                    )),
              ),
              const SizedBox(width: 10.0),
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
    required this.modulaciklama,
    required this.yukseklik,
    required this.agrlik,
    required this.fiyat,
    required this.kutudesi,
  });

  final GlobalKey dragKey;
  final String photoProvider;
  final String modulaciklama;
  final int yukseklik;
  final int agrlik;
  final double fiyat;
  final double kutudesi;

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
    required this.name,
    required this.uid,
    required this.imageProvider,
  });

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

  int get formattedTotalItemweight {
    final TotalItemweight = items.fold<int>(0, (prev, item) => item.agirlik);
    return TotalItemweight;
  }

  double get formattedTotalItemPrice {
    final TotalItemPrice = items.fold<double>(0, (prev, item) => item.fiyat);
    return TotalItemPrice;
  }

  double get formattedTotalItemDesi {
    final TotalItemDesi = items.fold<double>(0, (prev, item) => item.kutudesi);
    return TotalItemDesi;
  }

  int get ModulIdList {
    final imageprovider = items.fold<int>(0, (prev, item) => item.id);
    return imageprovider;
  }
}
