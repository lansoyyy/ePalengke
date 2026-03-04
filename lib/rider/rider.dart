/// Rider module — entry point
///
/// To launch the rider interface, navigate to [RiderJobsScreen].
///
/// Navigation flow:
///   RiderJobsScreen  →  RiderFinalizeReceiptScreen
///                    →  RiderDeliveryRouteScreen
///   RiderProfileScreen  (accessible from bottom nav on jobs / profile pages)

library rider;

export 'screens/rider_jobs_screen.dart';
export 'screens/rider_finalize_receipt_screen.dart';
export 'screens/rider_delivery_route_screen.dart';
export 'screens/rider_profile_screen.dart';
