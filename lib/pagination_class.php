<?php
    class Pagination_class{
        var $result;
        var $anchors;
        var $total;

        function Pagination_class($qry,$starting,$recpage,$aksi,$subaksi){
            $rst        =   mysql_query($qry) or die(mysql_error());
            $numrows    =   mysql_num_rows($rst);
            $qry.= " limit $starting, $recpage";
            // var_dump($qry);exit();
            $this->result=   mysql_query($qry) or die(mysql_error());
            $next       =   $starting+$recpage;
            $var        =   ((intval($numrows/$recpage))-1)*$recpage;
            $page_showing=   intval($starting/$recpage)+1;
            $total_page =   ceil($numrows/$recpage);

            if($numrows % $recpage != 0){
                $last = ((intval($numrows/$recpage)))*$recpage;
            }else{
                $last = ((intval($numrows/$recpage))-1)*$recpage;
            }$previous = $starting-$recpage;

            $anc = '<div class="pagination">';
            $anc .= '<ul>';
            if($previous < 0){ //gak aktif
                $anc .= '<li class="first disabled">
                            <a>
                                <i class="icon-first-2"></i>
                            </a>
                        </li>';
                $anc .= '<li class="prev disabled">
                            <a>
                                <i class="icon-previous"></i>
                            </a>
                        </li>';
            }else{ //aktif
                $anc .= '<li class="first">
                            <a href="javascript:pagination(0,\''.$aksi.'\',\''.$subaksi.'\');">
                                <i class="icon-first-2"></i>
                            </a>
                        </li>';
                $anc .= '<li  class="prev"> 
                            <a href="javascript:pagination('.$previous.',\''.$aksi.'\',\''.$subaksi.'\');">
                                <i class="icon-previous"></i>
                            </a>
                        </li>';
            }
     
            ################If you dont want the numbers just comment this block###############
            $norepeat = 2;//no of pages showing in the left and right side of the current page in the anchors
            $j        = 1;
            $anch     = "";
            for($i=$page_showing; $i>1; $i--){
                $fpreviousPage = $i-1;
                $page = ceil($fpreviousPage*$recpage)-$recpage;
                $anch = '<li>
                            <a href="javascript:pagination(\''.$page.'\',\''.$aksi.'\',\''.$subaksi.'\');">
                                '.$fpreviousPage.'
                            </a>
                        </li>'.$anch;
                if($j == $norepeat) 
                    break;
                $j++;
            }
            $anc .= $anch;
            $anc .='<li class="active"><a>'.$page_showing.'</a></li>';
            $j = 1;
            for($i=$page_showing; $i<$total_page; $i++)
            {
                $fnextPage = $i+1;
                $page = ceil($fnextPage*$recpage)-$recpage;
                $anc .= '<li>
                            <a href="javascript:pagination('.$page.',\''.$aksi.'\',\''.$subaksi.'\');">
                                '.$fnextPage.'
                            </a>
                        </li>';
                // $anc .= '<li class="prevnext" pg="'.$page.'"><a href="javascript:pagination('.$page.',\''.$aksi.'\',\''.$subaksi.'\');">'.$fnextPage.'</a></li>';
                if($j==$norepeat) 
                    break;
                $j++;
            }
            ############################################################
            if($next >= $numrows)
            {
                $anc .= '<li class="next disabled">
                            <a>
                                <i class="icon-next"></i>
                            </a>
                        </li>';
                $anc .= '<li class="last disabled">
                            <a>
                                <i class="icon-last-2"></i>
                            </a>
                        </li>';
            }
            else
            {
                $anc .= '<li class="next">
                            <a href="javascript:pagination('.$next.',\''.$aksi.'\',\''.$subaksi.'\');">
                                <i class="icon-next"></i>
                            </a>
                        </li>';
                        // <a href="javascript:pagination('.$next.',\''.$aksi.'\',\''.$subaksi.'\');">
                $anc .= '<li class="last">
                            <a href="javascript:pagination('.$last.',\''.$aksi.'\',\''.$subaksi.'\');">
                                <i class="icon-last-2"></i>
                            </a>
                        </li>';
            }
            $anc .= '</ul></div>';

            $this->anchors = $anc;
            $this->total ='Halaman ke: <b>'.$page_showing.'</b> dari <b>'.$total_page.'</b> (Total Data: <b>'.$numrows.'</b>)';
        }
    }
?>