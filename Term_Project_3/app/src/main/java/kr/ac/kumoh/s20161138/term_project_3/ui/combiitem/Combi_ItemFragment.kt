package kr.ac.kumoh.s20161138.term_project_3.ui.combiitem

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.DefaultItemAnimator
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.android.volley.toolbox.NetworkImageView
import kr.ac.kumoh.s20161138.term_project_3.R
import kr.ac.kumoh.s20161138.term_project_3.desc_CombiItem_Activity

class Combi_ItemFragment : Fragment() {

    private lateinit var model: Combi_ItemViewModel
    private val mAdapter = CombiItemAdapter()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        // 매번 요청하게 하려면 this (Fragment) 사용
        //model = ViewModelProvider(this).get(GundamViewModel::class.java)

        // 처음에 한 번만 요청하게 하려면 activity 사용
        model = ViewModelProvider(activity as AppCompatActivity).get(Combi_ItemViewModel::class.java)

        model.list.observe(viewLifecycleOwner, Observer<ArrayList<Combi_ItemViewModel.CombiItem>> {
            mAdapter.notifyDataSetChanged()
        })

        val root = inflater.inflate(R.layout.fragment_combiitem, container, false)

        val lsResult = root.findViewById<RecyclerView>(R.id.lsResult)
        lsResult.apply {
            layoutManager = LinearLayoutManager(activity)
            setHasFixedSize(true)
            itemAnimator = DefaultItemAnimator()
            adapter = mAdapter
        }

        return root
    }

    inner class CombiItemAdapter: RecyclerView.Adapter<CombiItemAdapter.ViewHolder>() {

        inner class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
            val txText1: TextView = itemView.findViewById<TextView>(R.id.text1)
            val txText2: TextView = itemView.findViewById<TextView>(R.id.text2)
            val txText3: TextView = itemView.findViewById<TextView>(R.id.text3)
            val txText4: TextView = itemView.findViewById<TextView>(R.id.text4)
            val txText5: TextView = itemView.findViewById<TextView>(R.id.text5)
            val txText7: TextView = itemView.findViewById<TextView>(R.id.text7)
            val niImage: NetworkImageView = itemView.findViewById<NetworkImageView>(R.id.image)

            val niImage1: NetworkImageView = itemView.findViewById<NetworkImageView>(R.id.mimage1)
            val niImage2: NetworkImageView = itemView.findViewById<NetworkImageView>(R.id.mimage2)

            init {
                niImage.setDefaultImageResId(android.R.drawable.ic_menu_report_image)
                niImage1.setDefaultImageResId(android.R.drawable.ic_menu_report_image)
                niImage2.setDefaultImageResId(android.R.drawable.ic_menu_report_image)
            }
        }

        override fun getItemCount(): Int {
            return model.getSize()
        }

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CombiItemAdapter.ViewHolder {
            val view = layoutInflater.inflate(
                R.layout.item_combi_item,
                parent,
                false)
            return ViewHolder(view)
        }

        override fun onBindViewHolder(holder: CombiItemAdapter.ViewHolder, position: Int) {
            val id = model.getCombiItem(position).id
            val name = model.getCombiItem(position).name
            val value1 = model.getCombiItem(position).value1
            val value2 = model.getCombiItem(position).value2
            val value3 = model.getCombiItem(position).value3
            val season = model.getCombiItem(position).season
            val material1 = model.getCombiItem(position).material1
            val material2 = model.getCombiItem(position).material2

            holder.txText1.text = name
            holder.txText2.text = value1
            holder.txText3.text = value2
            holder.txText4.text = value3
            holder.txText5.text = "조합식 : "
            holder.txText7.text = "    ["+material1 +" + "+material2+"]"


            holder.niImage.setImageUrl(model.getImageUrl(position), model.imageLoader)
            holder.niImage1.setImageUrl(model.getImageUrl1(position), model.imageLoader)
            holder.niImage2.setImageUrl(model.getImageUrl2(position), model.imageLoader)

            holder.itemView.setOnClickListener {
                val intent = Intent(holder.itemView?.context, desc_CombiItem_Activity::class.java)
                intent.putExtra("id", id)
                intent.putExtra("name", name)
                intent.putExtra("value1", value1)
                intent.putExtra("value2", value2)
                intent.putExtra("value3", value3)
                intent.putExtra("season", season)
                intent.putExtra("material1", material1)
                intent.putExtra("material2", material2)
                intent.putExtra("image", model.getImageUrl(position))
                intent.putExtra("mimage1", model.getImageUrl1(position))
                intent.putExtra("mimage2", model.getImageUrl2(position))
                ContextCompat.startActivity(holder.itemView.context, intent, null)
            }
        }
    }
}