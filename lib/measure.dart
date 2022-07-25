class conversion {
  var formule;

  Map<String, int> measures = {
    'meters': 0,
    'kilometers': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pounds': 6,
    'ounces': 7,
  };
  conversion() {
    formule = {
      '0': [1, .001, 0, 0, 3.28, .000621, 0, 0],
      '1': [1000, 1, 0, 0, 3280, .621, 0, 0],
      '2': [0, 0, 1, .001, 0, 0, .002204, .03527],
      '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
      '4': [.3048, .0003048, 0, 0, 1, .00018939, 0, 0],
      '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
      '6': [0, 0, 453.592, .453592, 0, 0, 1, 16],
      '7': [0, 0, 28.3495, .0283495, 3.28084, 0, .0625, 1],
    };
  }
  double convert(double value, String from, String to) {
    var nfrom = measures[from];
    var nto = measures[to];

    var multiplier = formule[nfrom.toString()][nto];
    return value * multiplier;
  }
}
