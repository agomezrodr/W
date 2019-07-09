package cs4330.cs.utep.edu.wabble;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class Waffle extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_waffle);
        this.setTitle("Bubble Waffles");
    }
}
