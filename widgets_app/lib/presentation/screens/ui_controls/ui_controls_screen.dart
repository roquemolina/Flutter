import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UIControlsView(),
    );
  }
}

enum Transportation { car, boat, submarine, plane }

class _UIControlsView extends StatefulWidget {
  const _UIControlsView({super.key});

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBrea = false;
  bool wantsLunc = false;
  bool wantsDinn = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          title: const Text('Developer Mode'),
          subtitle: const Text('Aditional controls'),
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
            title: const Text('Transport method'),
            subtitle: Text('$selectedTransportation'),
            children: [
              RadioListTile(
                value: Transportation.car,
                groupValue: selectedTransportation,
                title: const Text('Car'),
                subtitle: const Text('By Car'),
                onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.car;
                }),
              ),
              RadioListTile(
                value: Transportation.boat,
                groupValue: selectedTransportation,
                title: const Text('Boat'),
                subtitle: const Text('By Boat'),
                onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.boat;
                }),
              ),
              RadioListTile(
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                title: const Text('Submarine'),
                subtitle: const Text('By Submarine'),
                onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.submarine;
                }),
              ),
              RadioListTile(
                value: Transportation.plane,
                groupValue: selectedTransportation,
                title: const Text('Plane'),
                subtitle: const Text('By Plane'),
                onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.plane;
                }),
              ),
            ]),
        CheckboxListTile(
          value: wantsBrea,
          title: const Text('BreackFast'),
          onChanged: (value) => setState(() {
            wantsBrea = !wantsBrea;
          }),
        ),
        CheckboxListTile(
          value: wantsLunc,
          title: const Text('Lunch'),
          onChanged: (value) => setState(() {
            wantsLunc = !wantsLunc;
          }),
        ),
        CheckboxListTile(
          value: wantsDinn,
          title: const Text('Dinner'),
          onChanged: (value) => setState(() {
            wantsDinn = !wantsDinn;
          }),
        ),
      ],
    );
  }
}
