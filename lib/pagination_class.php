<?php
    class Pagination_class{
        var $result;
        var $anchors;
        var $total;

        // function Pagination_class($mnu,$qry,$starting,$recpage){
        function Pagination_class($qry,$starting,$recpage){
            $rst        =   mysql_query($qry) or die(mysql_error());
            $numrows    =   mysql_num_rows($rst);
            $qry        .= " limit $starting, $recpage";
            $this->result=   mysql_query($qry) or die(mysql_error());
            $next       =   $starting+$recpage;
            $var        =   ((intval($numrows/$recpage))-1)*$recpage;
            $page_showing=   intval($starting/$recpage)+1;
            $total_page =   ceil($numrows/$recpage);
            // var_dump($recpage);exit();
     
            if($numrows % $recpage != 0){
                $last = ((intval($numrows/$recpage)))*$recpage;
            }else{
                $last = ((intval($numrows/$recpage))-1)*$recpage;
            }
            $previous = $starting-$recpage;
            // $anc = '<ul id="pagination" class="pagination pagination-lg">';
           // <div class="pagination">
               // <ul>
                   // <li class="first"><a><i class="icon-first-2"></i></a></li>
                   // <li class="prev"><a><i class="icon-previous"></i></a></li>
                   
                   // <li><a>1</a></li>
                   // <li><a>2</a></li>
                   
                   // <li class="active"><a>3</a></li>
                   // <li class="spaces"><a>...</a></li>
                   // <li class="disabled"><a>4</a></li>
                   
                   // <li><a>500</a></li>
                   
                   // <li class="next"><a><i class="icon-next"></i></a></li>
                   // <li class="last"><a><i class="icon-last-2"></i></a></li>
               // </ul>
           // </div>
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
                // $anc .= '<li class="previous-disabled"><i class="icon-fast-backward"></i></li>';
                // $anc .= '<li class="previous-disabled"><i class="icon-step-backward"></i></li>';
            }else{ //aktif
                // $anc .= '<li pg=0 class="previous">
                //             <a href="javascript:pagination(0,\'tampil\');">
                //                 <i class="icon-fast-backward"></i>
                //             </a>
                //         </li>';
                // $anc .= '<li pg="'.$previous.'" class="previous"> 
                //             <a href="javascript:pagination('.$previous.',\'tampil\');">
                //                 <i class="icon-step-backward"></i>
                //             </a>
                //         </li>';

                $anc .= '<li class="first">
                            <a href="javascript:pagination(0,\'tampil\');">
                                <i class="icon-first-2"></i>
                            </a>
                        </li>';
                $anc .= '<li  class="prev"> 
                            <a href="javascript:pagination('.$previous.',\'tampil\');">
                                <i class="icon-previous"></i>
                            </a>
                        </li>';
                        // <a href="javascript:pagination('.$previous.',\'tampil\',\''.$mnu.'\');">
            }
     
            ################If you dont want the numbers just comment this block###############
            $norepeat = 2;//no of pages showing in the left and right side of the current page in the anchors
            $j        = 1;
            $anch     = "";
            for($i=$page_showing; $i>1; $i--){
                $fpreviousPage = $i-1;
                $page = ceil($fpreviousPage*$recpage)-$recpage;
                $anch = '<li>
                            <a href="javascript:pagination(\''.$page.'\',\'tampil\');">
                                '.$fpreviousPage.'
                            </a>
                        </li>'.$anch;
                // $anch = '<li class="prevnext" pg="'.$page.'"><a href="javascript:pagination(\''.$page.'\',\'tampil\');">'.$fpreviousPage.'</a></li>'.$anch;
                if($j == $norepeat) 
                    break;
                $j++;
            }
            $anc .= $anch;
            $anc .='<li class="active"><a>'.$page_showing.'</a></li>';
            // $anc .='<li class="active">'.$page_showing.'</li>';
            $j = 1;
            for($i=$page_showing; $i<$total_page; $i++)
            {
                $fnextPage = $i+1;
                $page = ceil($fnextPage*$recpage)-$recpage;
                $anc .= '<li>
                            <a href="javascript:pagination('.$page.',\'tampil\');">
                                '.$fnextPage.'
                            </a>
                        </li>';
                // $anc .= '<li class="prevnext" pg="'.$page.'"><a href="javascript:pagination('.$page.',\'tampil\');">'.$fnextPage.'</a></li>';
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
                // $anc .= '<li class="next-disabled"><i class="icon-step-forward"></i></li>';
                // $anc .= '<li class="next-disabled"><i class="icon-fast-forward"></i></li>';
            }
            else
            {
                $anc .= '<li class="next">
                            <a href="javascript:pagination('.$next.',\'tampil\');">
                                <i class="icon-next"></i>
                            </a>
                        </li>';
                $anc .= '<li class="last">
                            <a href="javascript:pagination('.$last.',\'tampil\');">
                                <i class="icon-last-2"></i>
                            </a>
                        </li>';
                // $anc .= '<li class="next" pg='.$next.'><a href="javascript:pagination('.$next.',\'tampil\');"><i class="icon-step-forward"></i></a></li>';
                // $anc .= '<li class="next" pg='.$last.'><a href="javascript:pagination('.$last.',\'tampil\');"><i class="icon-fast-forward"></i></a></li>';
            }
            $anc .= '</ul></div>';

            $this->anchors = $anc;
            $this->total ='Halaman ke: <b>'.$page_showing.'</b> dari <b>'.$total_page.'</b> (Total Data: <b>'.$numrows.'</b>)';
        }
    }
?>