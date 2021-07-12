package kr.ac.kumoh.s20161138.term_project_3.ui.basicitem

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
import kr.ac.kumoh.s20161138.term_project_3.desc_BasicItem_Activity

class Basic_ItemFragment : Fragment() {

    private lateinit var model: Basic_ItemViewModel
    private val mAdapter = BasicItemAdapter()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        // 매번 요청하게 하려면 this (Fragment) 사용
        //model = ViewModelProvider(this).get(GundamViewModel::class.java)

        // 처음에 한 번만 요청하게 하려면 activity 사용
        model = ViewModelProvider(activity as AppCompatActivity).get(Basic_ItemViewModel::class.java)

        model.list.observe(viewLifecycleOwner, Observer<ArrayList<Basic_ItemViewModel.BasicItem>> {
            mAdapter.notifyDataSetChanged()
        })

        val root = inflater.inflate(R.layout.fragment_basicitem, container, false)

        val lsResult = root.findViewById<RecyclerView>(R.id.lsResult)
        lsResult.apply {
            layoutManager = LinearLayoutManager(activity)
            setHasFixedSize(true)
            itemAnimator = DefaultItemAnimator()
            adapter = mAdapter
        }

        return root
    }

    inner class BasicItemAdapter: RecyclerView.Adapter<BasicItemAdapter.ViewHolder>() {

        inner class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
            val txText1: TextView = itemView.findViewById<TextView>(R.id.text1)
            val txText2: TextView = itemView.findViewById<TextView>(R.id.text2)
            val niImage: NetworkImageView = itemView.findViewById<NetworkImageView>(R.id.image)

            init {
                niImage.setDefaultImageResId(android.R.drawable.ic_menu_report_image)
            }
        }

        override fun getItemCount(): Int {
            return model.getSize()
        }

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): BasicItemAdapter.ViewHolder {
            val view = layoutInflater.inflate(
                R.layout.item_basic_item,
                parent,
                false)
            return ViewHolder(view)
        }

        override fun onBindViewHolder(holder: BasicItemAdapter.ViewHolder, position: Int) {
            val id = model.getBasicItem(position).id
            val name = model.getBasicItem(position).name
            val value = model.getBasicItem(position).value
            val season = model.getBasicItem(position).season

            holder.txText1.text = name
            holder.txText2.text = value
            holder.niImage.setImageUrl(model.getImageUrl(position), model.imageLoader)
            holder.itemView.setOnClickListener {
                val intent = Intent(holder.itemView?.context, desc_BasicItem_Activity::class.java)
                intent.putExtra("id", id)
                intent.putExtra("name", name)
                intent.putExtra("value", value)
                intent.putExtra("image", model.getImageUrl(position))
                intent.putExtra("season", season)
                ContextCompat.startActivity(holder.itemView.context, intent, null)
            }
        }
    }
}