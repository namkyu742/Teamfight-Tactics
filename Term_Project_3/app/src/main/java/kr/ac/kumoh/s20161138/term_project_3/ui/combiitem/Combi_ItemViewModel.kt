package kr.ac.kumoh.s20161138.term_project_3.ui.combiitem

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

class Combi_ItemViewModel(application: Application) : AndroidViewModel(application) {
    data class CombiItem(
        var id: Int,
        var name: String,
        var value1: String,
        var value2: String,
        var value3: String,
        var season:Int,
        var material1: String,
        var material2: String,
        var image: String,
        var mimage1: String,
        var mimage2: String)

    companion object {
        const val QUEUE_TAG = "VolleyRequest"
        const val SERVER_URL = "http://192.168.219.101:8080"
    }

    val imageLoader: ImageLoader
    val list = MutableLiveData<ArrayList<CombiItem>>()
    private val combiitem = ArrayList<CombiItem>()
    private var mQueue: RequestQueue

    init {
        list.value = combiitem
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
        requestCombiItem()        // ????
    }

    fun getImageUrl(i: Int): String = "$SERVER_URL/image/items/" + URLEncoder.encode(combiitem[i].image, "utf-8")
    fun getImageUrl1(i: Int): String = "$SERVER_URL/image/items/" + URLEncoder.encode(combiitem[i].mimage1, "utf-8")
    fun getImageUrl2(i: Int): String = "$SERVER_URL/image/items/" + URLEncoder.encode(combiitem[i].mimage2, "utf-8")

    fun requestCombiItem() {
        val request = JsonArrayRequest(
            Request.Method.GET,
            SERVER_URL+"/combiitem",
            null,
            {
                //Toast.makeText(getApplication(), it.toString(), Toast.LENGTH_LONG).show()
                combiitem.clear()
                parseJson(it)
                list.value = combiitem
            },
            {
                Toast.makeText(getApplication(), it.toString(), Toast.LENGTH_LONG).show()
            }
        )

        request.tag = QUEUE_TAG
        mQueue.add(request)
    }

    fun getCombiItem(i: Int) = combiitem[i]
    fun getSize() = combiitem.size

    override fun onCleared() {
        super.onCleared()
        mQueue.cancelAll(QUEUE_TAG)
    }

    private fun parseJson(items: JSONArray) {
        for (i in 0 until items.length()) {
            val item: JSONObject = items[i] as JSONObject
            val id = item.getInt("id")
            val name = item.getString("name")
            val value1 = item.getString("value1")
            val value2 = item.getString("value2")
            val value3 = item.getString("value3")
            val season = item.getInt("season")
            val material1 = item.getString("Material1")
            val material2 = item.getString("Material2")
            val image = item.getString("image")
            val mimage1 = item.getString("mimage1")
            val mimage2 = item.getString("mimage2")

            combiitem.add(CombiItem(id, name, value1, value2, value3, season, material1, material2, image, mimage1, mimage2))
        }
    }
}