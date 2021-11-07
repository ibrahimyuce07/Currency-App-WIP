import 'dart:convert';

CurrencyModel currencyModelFromJson(String str) => CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel {
  CurrencyModel({
    required this.success,
    required this.timestamp,
    required this.base,
    required this.date,
    required this.rates,
  });

  bool success;
  int timestamp;
  String base;
  DateTime date;
  Rates rates;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
    success: json["success"],
    timestamp: json["timestamp"],
    base: json["base"],
    date: DateTime.parse(json["date"]),
    rates: Rates.fromJson(json["rates"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "timestamp": timestamp,
    "base": base,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "rates": rates.toJson(),
  };
}

class Rates {
  Rates({
    required this.aed,
    required this.afn,
    required this.all,
    required this.amd,
    required this.ang,
    required this.aoa,
    required this.ars,
    required this.aud,
    required this.awg,
    required this.azn,
    required this.bam,
    required this.bbd,
    required this.bdt,
    required this.bgn,
    required this.bhd,
    required this.bif,
    required this.bmd,
    required this.bnd,
    required this.bob,
    required this.brl,
    required this.bsd,
    required this.btc,
    required this.btn,
    required this.bwp,
    required this.byn,
    required this.byr,
    required this.bzd,
    required this.cad,
    required this.cdf,
    required this.chf,
    required this.clf,
    required this.clp,
    required this.cny,
    required this.cop,
    required this.crc,
    required this.cuc,
    required this.cup,
    required this.cve,
    required this.czk,
    required this.djf,
    required this.dkk,
    required this.dop,
    required this.dzd,
    required this.egp,
    required this.ern,
    required this.etb,
    required this.eur,
    required this.fjd,
    required this.fkp,
    required this.gbp,
    required this.gel,
    required this.ggp,
    required this.ghs,
    required this.gip,
    required this.gmd,
    required this.gnf,
    required this.gtq,
    required this.gyd,
    required this.hkd,
    required this.hnl,
    required this.hrk,
    required this.htg,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.imp,
    required this.inr,
    required this.iqd,
    required this.irr,
    required this.isk,
    required this.jep,
    required this.jmd,
    required this.jod,
    required this.jpy,
    required this.kes,
    required this.kgs,
    required this.khr,
    required this.kmf,
    required this.kpw,
    required this.krw,
    required this.kwd,
    required this.kyd,
    required this.kzt,
    required this.lak,
    required this.lbp,
    required this.lkr,
    required this.lrd,
    required this.lsl,
    required this.ltl,
    required this.lvl,
    required this.lyd,
    required this.mad,
    required this.mdl,
    required this.mga,
    required this.mkd,
    required this.mmk,
    required this.mnt,
    required this.mop,
    required this.mro,
    required this.mur,
    required this.mvr,
    required this.mwk,
    required this.mxn,
    required this.myr,
    required this.mzn,
    required this.nad,
    required this.ngn,
    required this.nio,
    required this.nok,
    required this.npr,
    required this.nzd,
    required this.omr,
    required this.pab,
    required this.pen,
    required this.pgk,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.pyg,
    required this.qar,
    required this.ron,
    required this.rsd,
    required this.rub,
    required this.rwf,
    required this.sar,
    required this.sbd,
    required this.scr,
    required this.sdg,
    required this.sek,
    required this.sgd,
    required this.shp,
    required this.sll,
    required this.sos,
    required this.srd,
    required this.std,
    required this.svc,
    required this.syp,
    required this.szl,
    required this.thb,
    required this.tjs,
    required this.tmt,
    required this.tnd,
    required this.top,
    required this.ratesTry,
    required this.ttd,
    required this.twd,
    required this.tzs,
    required this.uah,
    required this.ugx,
    required this.usd,
    required this.uyu,
    required this.uzs,
    required this.vef,
    required this.vnd,
    required this.vuv,
    required this.wst,
    required this.xaf,
    required this.xag,
    required this.xau,
    required this.xcd,
    required this.xdr,
    required this.xof,
    required this.xpf,
    required this.yer,
    required this.zar,
    required this.zmk,
    required this.zmw,
    required this.zwl,
  });

  double aed;
  double afn;
  double all;
  double amd;
  double ang;
  double aoa;
  double ars;
  double aud;
  double awg;
  double azn;
  double bam;
  double bbd;
  double bdt;
  double bgn;
  double bhd;
  double bif;
  double bmd;
  double bnd;
  double bob;
  double brl;
  double bsd;
  double btc;
  double btn;
  double bwp;
  double byn;
  double byr;
  double bzd;
  double cad;
  double cdf;
  double chf;
  double clf;
  double clp;
  double cny;
  double cop;
  double crc;
  double cuc;
  double cup;
  double cve;
  double czk;
  double djf;
  double dkk;
  double dop;
  double dzd;
  double egp;
  double ern;
  double etb;
  int eur;
  double fjd;
  double fkp;
  double gbp;
  double gel;
  double ggp;
  double ghs;
  double gip;
  double gmd;
  double gnf;
  double gtq;
  double gyd;
  double hkd;
  double hnl;
  double hrk;
  double htg;
  double huf;
  double idr;
  double ils;
  double imp;
  double inr;
  double iqd;
  double irr;
  double isk;
  double jep;
  double jmd;
  double jod;
  double jpy;
  double kes;
  double kgs;
  double khr;
  double kmf;
  double kpw;
  double krw;
  double kwd;
  double kyd;
  double kzt;
  double lak;
  double lbp;
  double lkr;
  double lrd;
  double lsl;
  double ltl;
  double lvl;
  double lyd;
  double mad;
  double mdl;
  double mga;
  double mkd;
  double mmk;
  double mnt;
  double mop;
  double mro;
  double mur;
  double mvr;
  double mwk;
  double mxn;
  double myr;
  double mzn;
  double nad;
  double ngn;
  double nio;
  double nok;
  double npr;
  double nzd;
  double omr;
  double pab;
  double pen;
  double pgk;
  double php;
  double pkr;
  double pln;
  double pyg;
  double qar;
  double ron;
  double rsd;
  double rub;
  double rwf;
  double sar;
  double sbd;
  double scr;
  double sdg;
  double sek;
  double sgd;
  double shp;
  double sll;
  double sos;
  double srd;
  double std;
  double svc;
  double syp;
  double szl;
  double thb;
  double tjs;
  double tmt;
  double tnd;
  double top;
  double ratesTry;
  double ttd;
  double twd;
  double tzs;
  double uah;
  double ugx;
  double usd;
  double uyu;
  double uzs;
  double vef;
  double vnd;
  double vuv;
  double wst;
  double xaf;
  double xag;
  double xau;
  double xcd;
  double xdr;
  double xof;
  double xpf;
  double yer;
  double zar;
  double zmk;
  double zmw;
  double zwl;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
    aed: json["AED"].toDouble(),
    afn: json["AFN"].toDouble(),
    all: json["ALL"].toDouble(),
    amd: json["AMD"].toDouble(),
    ang: json["ANG"].toDouble(),
    aoa: json["AOA"].toDouble(),
    ars: json["ARS"].toDouble(),
    aud: json["AUD"].toDouble(),
    awg: json["AWG"].toDouble(),
    azn: json["AZN"].toDouble(),
    bam: json["BAM"].toDouble(),
    bbd: json["BBD"].toDouble(),
    bdt: json["BDT"].toDouble(),
    bgn: json["BGN"].toDouble(),
    bhd: json["BHD"].toDouble(),
    bif: json["BIF"].toDouble(),
    bmd: json["BMD"].toDouble(),
    bnd: json["BND"].toDouble(),
    bob: json["BOB"].toDouble(),
    brl: json["BRL"].toDouble(),
    bsd: json["BSD"].toDouble(),
    btc: json["BTC"].toDouble(),
    btn: json["BTN"].toDouble(),
    bwp: json["BWP"].toDouble(),
    byn: json["BYN"].toDouble(),
    byr: json["BYR"].toDouble(),
    bzd: json["BZD"].toDouble(),
    cad: json["CAD"].toDouble(),
    cdf: json["CDF"].toDouble(),
    chf: json["CHF"].toDouble(),
    clf: json["CLF"].toDouble(),
    clp: json["CLP"].toDouble(),
    cny: json["CNY"].toDouble(),
    cop: json["COP"].toDouble(),
    crc: json["CRC"].toDouble(),
    cuc: json["CUC"].toDouble(),
    cup: json["CUP"].toDouble(),
    cve: json["CVE"].toDouble(),
    czk: json["CZK"].toDouble(),
    djf: json["DJF"].toDouble(),
    dkk: json["DKK"].toDouble(),
    dop: json["DOP"].toDouble(),
    dzd: json["DZD"].toDouble(),
    egp: json["EGP"].toDouble(),
    ern: json["ERN"].toDouble(),
    etb: json["ETB"].toDouble(),
    eur: json["EUR"],
    fjd: json["FJD"].toDouble(),
    fkp: json["FKP"].toDouble(),
    gbp: json["GBP"].toDouble(),
    gel: json["GEL"].toDouble(),
    ggp: json["GGP"].toDouble(),
    ghs: json["GHS"].toDouble(),
    gip: json["GIP"].toDouble(),
    gmd: json["GMD"].toDouble(),
    gnf: json["GNF"].toDouble(),
    gtq: json["GTQ"].toDouble(),
    gyd: json["GYD"].toDouble(),
    hkd: json["HKD"].toDouble(),
    hnl: json["HNL"].toDouble(),
    hrk: json["HRK"].toDouble(),
    htg: json["HTG"].toDouble(),
    huf: json["HUF"].toDouble(),
    idr: json["IDR"].toDouble(),
    ils: json["ILS"].toDouble(),
    imp: json["IMP"].toDouble(),
    inr: json["INR"].toDouble(),
    iqd: json["IQD"].toDouble(),
    irr: json["IRR"].toDouble(),
    isk: json["ISK"].toDouble(),
    jep: json["JEP"].toDouble(),
    jmd: json["JMD"].toDouble(),
    jod: json["JOD"].toDouble(),
    jpy: json["JPY"].toDouble(),
    kes: json["KES"].toDouble(),
    kgs: json["KGS"].toDouble(),
    khr: json["KHR"].toDouble(),
    kmf: json["KMF"].toDouble(),
    kpw: json["KPW"].toDouble(),
    krw: json["KRW"].toDouble(),
    kwd: json["KWD"].toDouble(),
    kyd: json["KYD"].toDouble(),
    kzt: json["KZT"].toDouble(),
    lak: json["LAK"].toDouble(),
    lbp: json["LBP"].toDouble(),
    lkr: json["LKR"].toDouble(),
    lrd: json["LRD"].toDouble(),
    lsl: json["LSL"].toDouble(),
    ltl: json["LTL"].toDouble(),
    lvl: json["LVL"].toDouble(),
    lyd: json["LYD"].toDouble(),
    mad: json["MAD"].toDouble(),
    mdl: json["MDL"].toDouble(),
    mga: json["MGA"].toDouble(),
    mkd: json["MKD"].toDouble(),
    mmk: json["MMK"].toDouble(),
    mnt: json["MNT"].toDouble(),
    mop: json["MOP"].toDouble(),
    mro: json["MRO"].toDouble(),
    mur: json["MUR"].toDouble(),
    mvr: json["MVR"].toDouble(),
    mwk: json["MWK"].toDouble(),
    mxn: json["MXN"].toDouble(),
    myr: json["MYR"].toDouble(),
    mzn: json["MZN"].toDouble(),
    nad: json["NAD"].toDouble(),
    ngn: json["NGN"].toDouble(),
    nio: json["NIO"].toDouble(),
    nok: json["NOK"].toDouble(),
    npr: json["NPR"].toDouble(),
    nzd: json["NZD"].toDouble(),
    omr: json["OMR"].toDouble(),
    pab: json["PAB"].toDouble(),
    pen: json["PEN"].toDouble(),
    pgk: json["PGK"].toDouble(),
    php: json["PHP"].toDouble(),
    pkr: json["PKR"].toDouble(),
    pln: json["PLN"].toDouble(),
    pyg: json["PYG"].toDouble(),
    qar: json["QAR"].toDouble(),
    ron: json["RON"].toDouble(),
    rsd: json["RSD"].toDouble(),
    rub: json["RUB"].toDouble(),
    rwf: json["RWF"].toDouble(),
    sar: json["SAR"].toDouble(),
    sbd: json["SBD"].toDouble(),
    scr: json["SCR"].toDouble(),
    sdg: json["SDG"].toDouble(),
    sek: json["SEK"].toDouble(),
    sgd: json["SGD"].toDouble(),
    shp: json["SHP"].toDouble(),
    sll: json["SLL"].toDouble(),
    sos: json["SOS"].toDouble(),
    srd: json["SRD"].toDouble(),
    std: json["STD"].toDouble(),
    svc: json["SVC"].toDouble(),
    syp: json["SYP"].toDouble(),
    szl: json["SZL"].toDouble(),
    thb: json["THB"].toDouble(),
    tjs: json["TJS"].toDouble(),
    tmt: json["TMT"].toDouble(),
    tnd: json["TND"].toDouble(),
    top: json["TOP"].toDouble(),
    ratesTry: json["TRY"].toDouble(),
    ttd: json["TTD"].toDouble(),
    twd: json["TWD"].toDouble(),
    tzs: json["TZS"].toDouble(),
    uah: json["UAH"].toDouble(),
    ugx: json["UGX"].toDouble(),
    usd: json["USD"].toDouble(),
    uyu: json["UYU"].toDouble(),
    uzs: json["UZS"].toDouble(),
    vef: json["VEF"].toDouble(),
    vnd: json["VND"].toDouble(),
    vuv: json["VUV"].toDouble(),
    wst: json["WST"].toDouble(),
    xaf: json["XAF"].toDouble(),
    xag: json["XAG"].toDouble(),
    xau: json["XAU"].toDouble(),
    xcd: json["XCD"].toDouble(),
    xdr: json["XDR"].toDouble(),
    xof: json["XOF"].toDouble(),
    xpf: json["XPF"].toDouble(),
    yer: json["YER"].toDouble(),
    zar: json["ZAR"].toDouble(),
    zmk: json["ZMK"].toDouble(),
    zmw: json["ZMW"].toDouble(),
    zwl: json["ZWL"].toDouble(),
  );

  get TRY => null;



  set ratesUsd(double ratesUsd) {}

  get getRatesUsd => null;


  Map<String, dynamic> toJson() => {
    "AED": aed,
    "AFN": afn,
    "ALL": all,
    "AMD": amd,
    "ANG": ang,
    "AOA": aoa,
    "ARS": ars,
    "AUD": aud,
    "AWG": awg,
    "AZN": azn,
    "BAM": bam,
    "BBD": bbd,
    "BDT": bdt,
    "BGN": bgn,
    "BHD": bhd,
    "BIF": bif,
    "BMD": bmd,
    "BND": bnd,
    "BOB": bob,
    "BRL": brl,
    "BSD": bsd,
    "BTC": btc,
    "BTN": btn,
    "BWP": bwp,
    "BYN": byn,
    "BYR": byr,
    "BZD": bzd,
    "CAD": cad,
    "CDF": cdf,
    "CHF": chf,
    "CLF": clf,
    "CLP": clp,
    "CNY": cny,
    "COP": cop,
    "CRC": crc,
    "CUC": cuc,
    "CUP": cup,
    "CVE": cve,
    "CZK": czk,
    "DJF": djf,
    "DKK": dkk,
    "DOP": dop,
    "DZD": dzd,
    "EGP": egp,
    "ERN": ern,
    "ETB": etb,
    "EUR": eur,
    "FJD": fjd,
    "FKP": fkp,
    "GBP": gbp,
    "GEL": gel,
    "GGP": ggp,
    "GHS": ghs,
    "GIP": gip,
    "GMD": gmd,
    "GNF": gnf,
    "GTQ": gtq,
    "GYD": gyd,
    "HKD": hkd,
    "HNL": hnl,
    "HRK": hrk,
    "HTG": htg,
    "HUF": huf,
    "IDR": idr,
    "ILS": ils,
    "IMP": imp,
    "INR": inr,
    "IQD": iqd,
    "IRR": irr,
    "ISK": isk,
    "JEP": jep,
    "JMD": jmd,
    "JOD": jod,
    "JPY": jpy,
    "KES": kes,
    "KGS": kgs,
    "KHR": khr,
    "KMF": kmf,
    "KPW": kpw,
    "KRW": krw,
    "KWD": kwd,
    "KYD": kyd,
    "KZT": kzt,
    "LAK": lak,
    "LBP": lbp,
    "LKR": lkr,
    "LRD": lrd,
    "LSL": lsl,
    "LTL": ltl,
    "LVL": lvl,
    "LYD": lyd,
    "MAD": mad,
    "MDL": mdl,
    "MGA": mga,
    "MKD": mkd,
    "MMK": mmk,
    "MNT": mnt,
    "MOP": mop,
    "MRO": mro,
    "MUR": mur,
    "MVR": mvr,
    "MWK": mwk,
    "MXN": mxn,
    "MYR": myr,
    "MZN": mzn,
    "NAD": nad,
    "NGN": ngn,
    "NIO": nio,
    "NOK": nok,
    "NPR": npr,
    "NZD": nzd,
    "OMR": omr,
    "PAB": pab,
    "PEN": pen,
    "PGK": pgk,
    "PHP": php,
    "PKR": pkr,
    "PLN": pln,
    "PYG": pyg,
    "QAR": qar,
    "RON": ron,
    "RSD": rsd,
    "RUB": rub,
    "RWF": rwf,
    "SAR": sar,
    "SBD": sbd,
    "SCR": scr,
    "SDG": sdg,
    "SEK": sek,
    "SGD": sgd,
    "SHP": shp,
    "SLL": sll,
    "SOS": sos,
    "SRD": srd,
    "STD": std,
    "SVC": svc,
    "SYP": syp,
    "SZL": szl,
    "THB": thb,
    "TJS": tjs,
    "TMT": tmt,
    "TND": tnd,
    "TOP": top,
    "TRY": ratesTry,
    "TTD": ttd,
    "TWD": twd,
    "TZS": tzs,
    "UAH": uah,
    "UGX": ugx,
    "USD": usd,
    "UYU": uyu,
    "UZS": uzs,
    "VEF": vef,
    "VND": vnd,
    "VUV": vuv,
    "WST": wst,
    "XAF": xaf,
    "XAG": xag,
    "XAU": xau,
    "XCD": xcd,
    "XDR": xdr,
    "XOF": xof,
    "XPF": xpf,
    "YER": yer,
    "ZAR": zar,
    "ZMK": zmk,
    "ZMW": zmw,
    "ZWL": zwl,
  };
}