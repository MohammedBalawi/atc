import 'package:act_hub_mobile/core/extensions/extensions.dart';
import '../../../../core/funs/parse_color.dart';
import '../../../../core/funs/separate_to_days.dart';
import '../../domain/model/event_model.dart';
import '../../domain/model/resource_reservations_model.dart';
import '../response/resource_reservations_response.dart';

extension ResourceReservationsMapper on ResourceReservationsResponse {
  ResourceReservationsModel toDomain() {
    return ResourceReservationsModel(
      events: events!
          .map(
            (e) => EventModel(
              start: DateTime.parse(e.startDate.onNull()).onNull(),
              end: DateTime.parse(e.endDate.onNull()).onNull(),
              days: getDateRange(e.startDate.onNull(), e.endDate.onNull()),
              title: title.onNull(),
              color: parseColor(
                color.onNull(),
              ),
            ),
          )
          .toList(),
    );
  }
}
