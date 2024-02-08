class Employee {
  final int id;
  final String name;
  final double amount;
  final double deduct;
  final double commission;
  final double promo;
  final double tip;
  final double techTotal;
  bool status = false;

  Employee({
    required this.id,
    required this.name,
    required this.amount,
    required this.deduct,
    required this.commission,
    required this.promo,
    required this.tip,
    required this.techTotal,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      deduct: (json['deduct'] as num?)?.toDouble() ?? 0.0,
      commission: (json['commission'] as num?)?.toDouble() ?? 0.0,
      promo: (json['promo'] as num?)?.toDouble() ?? 0.0,
      tip: (json['tip'] as num?)?.toDouble() ?? 0.0,
      techTotal: (json['tech_total'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
