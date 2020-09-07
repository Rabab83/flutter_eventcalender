import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:marketingApp/model/actionbrief.dart';
import '../model/event.dart';
import 'package:firebase_core/firebase_core.dart';

DatabaseService<EventModel> eventDBS = DatabaseService<EventModel>("events",
    fromDS: (id, data) => EventModel.fromDS(id, data),
    toMap: (event) => event.toMap());

DatabaseService<ActionBrief> actionDBS = DatabaseService<ActionBrief>(
    "actoinbrief",
    fromDS: (id, data) => ActionBrief.fromDS(id, data),
    toMap: (action) => action.toMap());
