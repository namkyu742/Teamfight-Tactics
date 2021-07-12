package kr.ac.kumoh.s20161138.term_project_3

import android.graphics.Bitmap
import android.os.Bundle
import android.util.LruCache
import androidx.appcompat.app.AppCompatActivity
import com.android.volley.toolbox.ImageLoader
import com.android.volley.toolbox.Volley
import kotlinx.android.synthetic.main.activity_desc_combiitem.*

class desc_CombiItem_Activity : AppCompatActivity()  {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_desc_combiitem)

        val id = intent.getIntExtra("id", -1)
        val name = intent.getStringExtra("name")
        val value1 = intent.getStringExtra("value1")
        val value2 = intent.getStringExtra("value2")
        val value3 = intent.getStringExtra("value3")
        val season = intent.getIntExtra("season", -1)
        val material1 = intent.getStringExtra("material1")
        val material2 = intent.getStringExtra("material2")
        val image = intent.getStringExtra("image")
        val mimage1 = intent.getStringExtra("mimage1")
        val mimage2 = intent.getStringExtra("mimage2")

        val mQueue = Volley.newRequestQueue(application)
        val imageLoader = ImageLoader(
            mQueue,
            object : ImageLoader.ImageCache {
                private val cache = LruCache<String, Bitmap>(100)
                override fun getBitmap(url: String): Bitmap? {
                    return cache.get(url)
                }
                override fun putBitmap(url: String, bitmap: Bitmap) {
                    cache.put(url, bitmap)
                }
            })


        textView1.text = "이름 : "+name+"("+season.toString()+"시즌)"
        textView2.text = "효과 : "+value1
        textView3.text = value2
        textView4.text = value3
        textView7.text = "   ["+material1+" + "+material2+"]"
//
//        textView3.text = mimage1+", "+mimage2

        imageView.setImageUrl(image, imageLoader)
        imageView1.setImageUrl(mimage1, imageLoader)
        imageView2.setImageUrl(mimage2, imageLoader)
    }
}