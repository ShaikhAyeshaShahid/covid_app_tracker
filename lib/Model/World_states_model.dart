/// date : 20210307
/// states : 56
/// positive : 28756489
/// negative : 74582825
/// pending : 11808
/// hospitalizedCurrently : 40199
/// hospitalizedCumulative : 776361
/// inIcuCurrently : 8134
/// inIcuCumulative : 45475
/// onVentilatorCurrently : 2802
/// onVentilatorCumulative : 4281
/// dateChecked : "2021-03-07T24:00:00Z"
/// death : 515151
/// hospitalized : 776361
/// totalTestResults : 363825123
/// lastModified : "2021-03-07T24:00:00Z"
/// recovered : null
/// total : 0
/// posNeg : 0
/// deathIncrease : 842
/// hospitalizedIncrease : 726
/// negativeIncrease : 131835
/// positiveIncrease : 41835
/// totalTestResultsIncrease : 1170059
/// hash : "a80d0063822e251249fd9a44730c49cb23defd83"

class WorldStatesModel {
  WorldStatesModel({
      this.date, 
      this.states, 
      this.positive, 
      this.negative, 
      this.pending, 
      this.hospitalizedCurrently, 
      this.hospitalizedCumulative, 
      this.inIcuCurrently, 
      this.inIcuCumulative, 
      this.onVentilatorCurrently, 
      this.onVentilatorCumulative, 
      this.dateChecked, 
      this.death, 
      this.hospitalized, 
      this.totalTestResults, 
      this.lastModified, 
      this.recovered, 
      this.total, 
      this.posNeg, 
      this.deathIncrease, 
      this.hospitalizedIncrease, 
      this.negativeIncrease, 
      this.positiveIncrease, 
      this.totalTestResultsIncrease, 
      this.hash,});

  WorldStatesModel.fromJson(dynamic json) {
    date = json['date'];
    states = json['states'];
    positive = json['positive'];
    negative = json['negative'];
    pending = json['pending'];
    hospitalizedCurrently = json['hospitalizedCurrently'];
    hospitalizedCumulative = json['hospitalizedCumulative'];
    inIcuCurrently = json['inIcuCurrently'];
    inIcuCumulative = json['inIcuCumulative'];
    onVentilatorCurrently = json['onVentilatorCurrently'];
    onVentilatorCumulative = json['onVentilatorCumulative'];
    dateChecked = json['dateChecked'];
    death = json['death'];
    hospitalized = json['hospitalized'];
    totalTestResults = json['totalTestResults'];
    lastModified = json['lastModified'];
    recovered = json['recovered'];
    total = json['total'];
    posNeg = json['posNeg'];
    deathIncrease = json['deathIncrease'];
    hospitalizedIncrease = json['hospitalizedIncrease'];
    negativeIncrease = json['negativeIncrease'];
    positiveIncrease = json['positiveIncrease'];
    totalTestResultsIncrease = json['totalTestResultsIncrease'];
    hash = json['hash'];
  }
  int? date;
  int? states;
  int? positive;
  int? negative;
  int? pending;
  int? hospitalizedCurrently;
  int? hospitalizedCumulative;
  int? inIcuCurrently;
  int? inIcuCumulative;
  int? onVentilatorCurrently;
  int? onVentilatorCumulative;
  String? dateChecked;
  int? death;
  int? hospitalized;
  int? totalTestResults;
  String? lastModified;
  dynamic recovered;
  int? total;
  int? posNeg;
  int? deathIncrease;
  int? hospitalizedIncrease;
  int? negativeIncrease;
  int? positiveIncrease;
  int? totalTestResultsIncrease;
  String? hash;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['states'] = states;
    map['positive'] = positive;
    map['negative'] = negative;
    map['pending'] = pending;
    map['hospitalizedCurrently'] = hospitalizedCurrently;
    map['hospitalizedCumulative'] = hospitalizedCumulative;
    map['inIcuCurrently'] = inIcuCurrently;
    map['inIcuCumulative'] = inIcuCumulative;
    map['onVentilatorCurrently'] = onVentilatorCurrently;
    map['onVentilatorCumulative'] = onVentilatorCumulative;
    map['dateChecked'] = dateChecked;
    map['death'] = death;
    map['hospitalized'] = hospitalized;
    map['totalTestResults'] = totalTestResults;
    map['lastModified'] = lastModified;
    map['recovered'] = recovered;
    map['total'] = total;
    map['posNeg'] = posNeg;
    map['deathIncrease'] = deathIncrease;
    map['hospitalizedIncrease'] = hospitalizedIncrease;
    map['negativeIncrease'] = negativeIncrease;
    map['positiveIncrease'] = positiveIncrease;
    map['totalTestResultsIncrease'] = totalTestResultsIncrease;
    map['hash'] = hash;
    return map;
  }

}