import 'package:flutter/widgets.dart';

class NativeScrollBuilder extends StatefulWidget {
  ScrollController? scrollController;
  final Widget Function(BuildContext context, ScrollController controller)
      builder;

  NativeScrollBuilder({
    Key? key,
    required this.builder,
    this.scrollController
  }) : super(key: key);

  @override
  _NativeScrollBuilderState createState() => _NativeScrollBuilderState();
}

class _NativeScrollBuilderState extends State<NativeScrollBuilder> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    if(widget.scrollController != null){
      _scrollController = widget.scrollController!;
    }else{
      _scrollController = ScrollController();
    }
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _scrollController);
  }
}
