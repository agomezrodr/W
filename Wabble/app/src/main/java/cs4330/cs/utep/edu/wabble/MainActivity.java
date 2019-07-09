package cs4330.cs.utep.edu.wabble;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
Button soda, waf, sand, sala,frap;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        soda = findViewById(R.id.soda);
        waf = findViewById(R.id.waffle);
        sand = findViewById(R.id.sandwich);
        sala = findViewById(R.id.salad);
        frap = findViewById(R.id.frappe);

        soda.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MainActivity.this, Sodas.class);
                startActivity(i);
            }
        });
        waf.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MainActivity.this, Waffle.class);
                startActivity(i);
            }
        });
        sand.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MainActivity.this, Sandwich.class);
                startActivity(i);
            }
        });
        sala.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MainActivity.this, Salad.class);
                startActivity(i);
            }
        });
        frap.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MainActivity.this, Frappe.class);
                startActivity(i);
            }
        });
    }
}
