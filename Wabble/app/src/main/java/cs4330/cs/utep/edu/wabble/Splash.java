package cs4330.cs.utep.edu.wabble;
/*
Adrian Gomez Rodriguez and Jesus Ramos
CS4330 Mobile apps
Dr. Cheon
 */
import android.app.Activity;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.TextView;

public class Splash extends Activity {
    TextView title, name;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.splash);
        title = (TextView) findViewById(R.id.textView);
        name = (TextView) findViewById(R.id.textView2);


        final Animation animation = AnimationUtils.loadAnimation(getBaseContext(), R.anim.fadeout);
        title.startAnimation(animation);
        animation.setAnimationListener(new Animation.AnimationListener() {

            @Override
            public void onAnimationStart(Animation animation) { }

            @Override
            public void onAnimationEnd(Animation animation) {
                finish();
                Intent intent = new Intent(Splash.this, MainActivity.class);
                startActivity(intent);
            }

            @Override
            public void onAnimationRepeat(Animation animation) {
            }
        });
    }
}