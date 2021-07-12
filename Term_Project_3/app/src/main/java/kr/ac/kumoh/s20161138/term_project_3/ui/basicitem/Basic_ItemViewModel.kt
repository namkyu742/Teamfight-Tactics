package kr.ac.kumoh.s20161138.term_project_3.ui.basicitem

import androidx.lifecycle.MutableLiveData
import android.app.Application
import android.graphics.Bitmap
import android.widget.Toast
import androidx.collection.LruCache
import androidx.lifecycle.AndroidViewModel
import com.android.volley.Request
import com.android.volley.RequestQueue
import com.android.volley.toolbox.ImageLoader
import com.android.volley.toolbox.JsonArrayRequest
import com.android.volley.toolbox.Volley
import org.json.JSONArray
import org.json.JSONObject
import java.net.URLEncoder

class Basic_ItemViewModel(application: Application) : AndroidViewModel(application) {
    data class BasicItem(var id: Int, var name: String, var value: String, var season:Int, var image: String)
    companion object {
        const val QUEUE_TAG = "VolleyRequest"
        const val SERVER_URL = "http://192.168.219.101:8080"
    }

    val imageLoader: ImageLoader
    val list = MutableLiveData<ArrayList<BasicItem>>()
    private val basicitem = ArrayList<BasicItem>()
    private var mQueue: RequestQueue

    init {
        list.value = basicitem
        mQueue = Volley.newRequestQueue(application)

        imageLoader = ImageLoader(mQueue,
            object : ImageLoader.ImageCache {
                private val cache = LruCache<String, Bitmap>(100)
                override fun getBitmap(url: String): Bitmap? {
                    return cache.get(url)
                }
                override fun putBitmap(url: String, bitmap: Bitmap) {
                    cache.put(url, bitmap)
                }
            })
        requestBasicItem()        // ????
    }

    fun getImageUrl(i: Int): String = "$SERVER_URL/image/items/" + URLEncoder.encode(basicitem[i].image, "utf-8")

    fun requestBasicItem() {
        val request = JsonArrayRequest(
            Request.Method.GET,
            SERVER_URL+"/basicitem",
            null,
            {
                //Toast.makeText(getApplication(), it.toString(), Toast.LENGTH_LONG).show()
                basicitem.clear()
                parseJson(it)
                list.value = basicitem
            },
            {
                Toast.makeText(getApplication(), it.toString(), Toast.LENGTH_LONG).show()
            }
        )

        request.tag = QUEUE_TAG
        mQueue.add(request)
    }

    fun getBasicItem(i: Int) = basicitem[i]
    fun getSize() = basicitem.size

    override fun onCleared() {
        super.onCleared()
        mQueue.cancelAll(QUEUE_TAG)
    }

    private fun parseJson(items: JSONArray) {
        for (i in 0 until items.length()) {
            val item: JSONObject = items[i] as JSONObject
            val id = item.getInt("id")
            val name = item.getString("name")
            val value = item.getString("value")
            val season = item.getInt("season")
            val image = item.getString("image")

            basicitem.add(BasicItem(id, name, value, season, image))
        }
    }
}