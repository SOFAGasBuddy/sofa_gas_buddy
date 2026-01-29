import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sofa_gas_buddy/esso_data.dart';
import 'package:sofa_gas_buddy/utils/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  EssoData ed = EssoData();
  String labelData = "";
  String labelRefreshData = "";
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final oldData = await ed.loadOldData();
    final lastRefresh = await ed.lastRefreshedTime();
    if (mounted) {
      setState(() {
        labelData = oldData;
        labelRefreshData = lastRefresh;
      });
    }
  }

  Future<void> _refreshData() async {
    try {
      var (accountData, refreshData, status) = await ed.getData();

      if (status == Status.blankCreds) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Please enter a valid ID, VRN and ID Type on the Settings page')));
        return;
      }
      if (status == Status.badResponse) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Failed to retrieve data from server, please try again.')));
        return;
      }

      if (status != Status.success) {
        await storage.write(key: "LAST_ERROR", value: "$status");
        setState(() {
          labelData = "Failed to retrieve data. Please try again.";
        });
        return;
      }
      setState(() {
        labelData = accountData;
        labelRefreshData = refreshData;
      });
    } catch (ex) {
      await storage.write(key: "LAST_ERROR", value: "$ex");
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Failed to retrieve data from server, please try again. Currently displaying last known information.')));
      String? oldData = await ed.loadOldData();
      String? lastRefresh = await ed.lastRefreshedTime();

      if (mounted) {
        setState(() {
          labelData = oldData;
          labelRefreshData = lastRefresh;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle = DefaultTextStyle.of(context).style;
    final boldStyle = defaultStyle.copyWith(fontWeight: FontWeight.bold);

    List<InlineSpan> buildSpans(String data) {
      List<InlineSpan> spans = [];
      final lines = data.split('');
      for (var i = 0; i < lines.length; i++) {
        final line = lines[i];
        if (line.isNotEmpty) {
          final index = line.indexOf(':');
          if (index != -1) {
            spans.add(TextSpan(text: line.substring(0, index + 1)));
            spans.add(TextSpan(
              text: line.substring(index + 1),
              style: boldStyle,
            ));
          } else {
            spans.add(TextSpan(text: line));
          }
        }

        if (i < lines.length - 1) {
          spans.add(const TextSpan(text: ''));
        }
      }
      return spans;
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: FloatingActionButton(
            onPressed: _refreshData,
            tooltip: 'Refresh Data',
            child: const Icon(Icons.update),
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: defaultStyle,
            children: buildSpans(labelData),
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: defaultStyle,
            children: buildSpans(labelRefreshData),
          ),
        ),
      ],
    );
  }
}
