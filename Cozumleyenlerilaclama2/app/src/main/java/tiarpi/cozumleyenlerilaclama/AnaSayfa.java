package tiarpi.cozumleyenlerilaclama;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.RequestParams;

public class AnaSayfa extends AppCompatActivity {

    public Button btn_Istasyon;
    public Button btn_Bildirim;
    public Button btn_Takvim;
    public String Empid;
    public String postEmpId;
    public AsyncHttpClient client = new AsyncHttpClient();
    // Http Request Params Object
    public RequestParams params = new RequestParams();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ana_sayfa);

        Intent intent=getIntent();
        Empid=intent.getStringExtra(Login.Id);
        btn_Istasyon=(Button) findViewById(R.id.btn_Istasyon);
        btn_Bildirim=(Button) findViewById(R.id.btn_Bildirim);
        btn_Takvim=(Button)findViewById(R.id.btn_Takvim);

        btn_Istasyon.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


            }
        });

        btn_Bildirim.setOnClickListener(new View.OnClickListener(){
            public void onClick(View v) {

                Intent intent = new Intent(getApplicationContext(), Bildirimler.class);
                intent.putExtra(postEmpId,Empid);
                startActivity(intent);
            }
        });

      btn_Takvim.setOnClickListener(new View.OnClickListener(){
          public void onClick(View v) {



          }
      });

    }
}
