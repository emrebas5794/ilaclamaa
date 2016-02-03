package tiarpi.cozumleyenlerilaclama;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class Bildirimler extends AppCompatActivity {

    public AsyncHttpClient client = new AsyncHttpClient();
     String[] bildirimArr;
    // Http Request Params Object
    public RequestParams params = new RequestParams();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bildirimler);

        Intent intent=getIntent();
        String Empid=intent.getStringExtra(Login.Id);

        params.put("Id", Empid);
        client.post("http://192.168.1.12/Api/Bildirim", params, new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(String s) {
                JSONParser jparser=new JSONParser();
                try {
                    Object obj=jparser.parse(s);
                    JSONArray array=(JSONArray)obj;



                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
        });
    }
}
