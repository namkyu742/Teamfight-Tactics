package kr.ac.kumoh.s20161138.term_project_3

import android.graphics.Bitmap
import android.os.Bundle
import android.util.LruCache
import androidx.appcompat.app.AppCompatActivity
import com.android.volley.toolbox.ImageLoader
import com.android.volley.toolbox.Volley
import kotlinx.android.synthetic.main.activity_desc_basicitem.*

class desc_BasicItem_Activity : AppCompatActivity()  {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_desc_basicitem)

        val id = intent.getIntExtra("id", -1)
        val name = intent.getStringExtra("name")
        val value = intent.getStringExtra("value")
        val image = intent.getStringExtra("image")
        val season = intent.getIntExtra("season", -1)

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


        textView.text = "이름 : "+name+"("+season.toString()+"시즌)"
        textView2.text = "효과 : "+value
        imageView.setImageUrl(image, imageLoader)
    }
}