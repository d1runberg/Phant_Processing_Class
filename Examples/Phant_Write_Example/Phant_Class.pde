//Phant class for Processing based off of the Phant library by Todd Trece
//This software is Beerware, use it free and if we ever meet
//you can buy me a beer and tell me how bad my code is.

//By: Derek Runberg
//SparkFun Electronics


class Phant 
{
  String _host = "";
  String _pub = "";
  String _prv = "";
  String _params=""; 
  String _del="";
  int _pRate;
  int _gRate;

  
  Phant () //alt object for reading public feeds
  {  
    
  } 

  /////////////////////VOID FUNCTIONS//////////////////////////
  /////////////////////////////////////////////////////////////
  void startFeed(String host, String publicKey)
  {
    _host = host;
    _pub = publicKey;
    _params="";

    println("-----------------------------------------------");
    println("          PHANT  REPORTING ONLINE              ");
    println("-----------------------------------------------");
  }
  
   void startFeed(String host, String publicKey, String privateKey)
  {
    _host = host;
    _pub = publicKey;
    _prv = privateKey;
    _params="";


    println("-----------------------------------------------");
    println("          PHANT  REPORTING ONLINE              ");
    println("-----------------------------------------------");
  }

 void setDeleteKey(String deleteKey)
 {
   _del = deleteKey;
 }

  void addField(String field, char data)
  {
    _params = _params + '&' + field + '=' + str(data);
  }

  void addField(String field, int data)
  {
    _params = _params + '&' + field + '=' + str(data);
  }

  void addField(String field, float data)
  {
    _params = _params + '&' + field + '=' + str(data);
  }

  void addField(String field, String data)
  {
    _params = _params + '&' + field + '=' + data;
  }

  void postRate(int seconds)
  {
    _pRate = seconds;
  }

  void getRate( int seconds)
  {
    _gRate= seconds;
  }
  
  int getRate()
  {
    int _rate =_gRate;
    return _rate;
  }

  void post()
  {
    if(millis()%1000 == _pRate)
    {
    String result = "http://" + _host + "/input/" +_pub;
    result += "?private_key=" + _prv + _params;
    _params="";    
      println("URL posted to: "+ result);
      loadStrings(result);
    }
    else
    {
     _params =""; 
    }

  }

  void clear()
  {
    String result ="http://" +_host + "/input/" + _pub + "/clear?" + "private_key=" + _prv;
    
    loadStrings(result);
    println("clearing data from feed: "+result);
  }

  void deleteFeed(Boolean areYouSure)
  {
    if (areYouSure==true)
    {
      String result = "http://" + _host + "/streams/" + _pub + "/delete/" + _del;
      loadStrings(result);
      delay(500);
      println("---------FEED DELETED!-----------");
    }
  }

  ////////////////////////CSV GET FUNCTIONS//////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  String[] getCSV()
  {
    String _getCSV[]={};
      String result = "http://" + _host + "/output/" + _pub+".csv";
      _getCSV =loadStrings(result);
    return _getCSV;
  }

  String[] getCSVLimit(int limit)
  {
    String _getCSV[]={};
    String result = "http://" + _host + "/output/" + _pub+".csv"+"?"+"limit="+limit;
    _getCSV =loadStrings(result);
    return _getCSV;
  }

  String[] getCSVFilter(String filter1, String field1, float value1)
  {

      String _filter1 = filter1+"["+field1+"]"+"="+value1;
      String result = "http://" + _host + "/output/" + _pub + ".csv"+"?"+_filter1;
      String _getCSV[]= loadStrings(result);
      return _getCSV;
  }

  String[] getCSVFilter(String filter1, String field1, float value1, String filter2, String field2, float value2)
  {
      String _filter1 = filter1+"["+field1+"]"+"="+value1;
      String _filter2 = "&"+filter2+"["+field2+"]"+"="+value2;
      String result = "http://" + _host + "/output/" + _pub + ".csv"+"?"+_filter1+_filter2;
      String _getCSV[]= loadStrings(result);
      return _getCSV;   
  }

  String[] getCSVLatest()
  {
    
      String result = "http://" + _host + "/output/" + _pub +"/latest" + ".csv";
      String _CSVLatest[] = loadStrings(result);
      return _CSVLatest;

  }

  /////////////////////////////JSON GET FUNCTIONS/////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////

  JSONArray getJSON()
  {
    
      JSONArray _getJSON;
      String result = "http://" + _host + "/output/" + _pub+".json";
      _getJSON= loadJSONArray(result);
      return _getJSON;
  }

  JSONArray getJSONLimit(int limit)
  {
      String result = "http://" + _host + "/output/" + _pub+".json"+"?"+"limit="+limit;
      JSONArray _getJSON= loadJSONArray(result);
      return _getJSON;
  }

  JSONArray getJSONFilter(String filter1, String field1, float value1)
  { 
   String _filter1 = filter1+"["+field1+"]"+"="+value1;
      String result = "http://" + _host + "/output/" + _pub + ".json"+"?"+_filter1;
      JSONArray _getJSON= loadJSONArray(result);
      return _getJSON;
 

  }

  JSONObject getJSONFilter(String filter1, String field1, float value1, String filter2, String field2, float value2)
  {
    
      String _filter1 = filter1+"["+field1+"]"+"="+value1;
      String _filter2 = "&"+filter2+"["+field2+"]"+"="+value2;
      String result = "http://" + _host + "/output/" + _pub + ".json"+"?"+_filter1+_filter2;
      JSONObject _getJSON= loadJSONObject(result);
      return _getJSON;
    
  }

  JSONObject getJSONLatest()
  {
      String result = "http://" + _host + "/output/" + _pub +"/latest" + ".json";
      JSONArray _getArray= loadJSONArray(result);
      JSONObject _getJSON= _getArray.getJSONObject(0);
      return _getJSON;
  }

  //////////////////////////STATS FUNCTIONS/////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////
  int pageCount()
  {
    String result = "http://" + _host + "/output/" +_pub+"/stats.json";
    JSONObject _stats = loadJSONObject(result);
    int _pageCount= _stats.getInt("pageCount");
    return _pageCount;
  }

  int bytesRemaining()
  {
    String result = "http://" + _host + "/output/" + _pub+"/stats.json";
    JSONObject _stats = loadJSONObject(result);
    int _remaining= _stats.getInt("remaining");
    return _remaining;
  }

  int bytesCap()
  {
    String result = "http://" + _host + "/output/" + _pub+"/stats.json";
    JSONObject _stats = loadJSONObject(result);
    int _cap= _stats.getInt("cap");
    return _cap;
  }

  int bytesUsed()
  {
    String result = "http://" + _host + "/output/" + _pub+"/stats.json";
    JSONObject _stats = loadJSONObject(result);
    int _used= _stats.getInt("used");
    return _used;
  }
}

