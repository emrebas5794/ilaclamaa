package tiarpi.cozumleyenlerilaclama;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.common.api.GoogleApiClient;
import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class Login extends AppCompatActivity {

    public static String SessionId="";
    public EditText UserName;
    public EditText Password;
    public Button btn_Login;
    public  static String Id;
    public AsyncHttpClient client = new AsyncHttpClient();
        // Http Request Params Object
    public RequestParams params = new RequestParams();
    /**
     * ATTENTION: This was auto-generated to implement the App Indexing API.
     * See https://g.co/AppIndexing/AndroidStudio for more information.
     */
    private GoogleApiClient client2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        UserName = (EditText) findViewById(R.id.editTxt_UserName);
        Password = (EditText) findViewById(R.id.editTxt_Password);
        btn_Login = (Button) findViewById(R.id.btn_Login);


        btn_Login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String ad = UserName.getText().toString();
                String sifre = Password.getText().toString();

                final String hata = "hata";
                params.put("KullaniciAdi", ad);
                params.put("Sifre", sifre);


                //PersistentCookieStore myCookieStore=new PersistentCookieStore(SessionId);
                //client.setCookieStore(myCookieStore);
                client.post("http://192.168.1.12/Api/Personel", params, new AsyncHttpResponseHandler() {
                    public void onSuccess(String responce) {//////Get your Response/////
                        System.out.println(responce.toString());

                        try {
                            JSONParser jparser = new JSONParser();
                            Object obj = jparser.parse(responce);
                            JSONArray array = (JSONArray) obj;

                            JSONObject obj2 = (JSONObject) array.get(0);

                            if (obj2.get("Id").toString().equals(hata)) {
                                UserName.setText("");
                                Password.setText("");
                                Toast.makeText(getApplicationContext(), "Bilgilerinizde yanlışlık var!!!",
                                        Toast.LENGTH_LONG).show();

                            } else {
                                SessionId = obj2.get("SessionId").toString();
                                Intent intent = new Intent(getApplicationContext(), AnaSayfa.class);
                                intent.putExtra(Id,obj2.get("Id").toString());

                                startActivity(intent);
                            }

                        } catch (ParseException e) {
                            e.printStackTrace();
                        }

                    }

                });
                }
        });


    }

}
