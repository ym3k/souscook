/*
 * appendRow: テーブルに行を追加
 */
function appendRow()
{
    var objTBL = document.getElementById("tbl");
    if (!objTBL)
        return;
    
    var count = objTBL.rows.length;
    
    // 最終行に新しい行を追加
    var row = objTBL.insertRow(count);

    // 列の追加
    var c1 = row.insertCell(0);
    var c2 = row.insertCell(1);
    var c3 = row.insertCell(2);
    var c4 = row.insertCell(3);

    // 各列にスタイルを設定
    // c1.style.cssText = "text-align:right; width:40px;";
    // c2.style.cssText = "";
    // c3.style.cssText = "background-color: green; width:40px;";
    
    // 各列に表示内容を設定
    c1.innerHTML = 0
    c2.innerHTML = '<input class="inpval" type="text"   id="article' + count + '" name="txt' + count + '" value="">';
    c3.innerHTML = '<input class="inpval" type="text"   id="quantity' + count + '" name="txt' + count + '" value="">';
    c4.innerHTML = '<input class="delbtn" type="button" id="delBtn' + count + '" value="削除" onclick="deleteRow(this)">';
    
    // 追加した行の入力フィールドへフォーカスを設定
    var objInp = document.getElementById("article" + count);
    if (objInp)
        objInp.focus();
}

/*
 * deleteRow: 削除ボタン該当行を削除
 */
function deleteRow(obj)
{
    // 確認
    if (!confirm("この行を削除しますか？"))
        return;

    if (!obj)
        return;

    var objTR = obj.parentNode.parentNode;
    var objTBL = objTR.parentNode;
    
    if (objTBL)
        objTBL.deleteRow(objTR.sectionRowIndex);
    
    // <span> 行番号ふり直し
    var tagElements = document.getElementsByTagName("span");
    if (!tagElements)
        return false;

    var seq = 1;
    for (var i = 0; i < tagElements.length; i++)
    {
        if (tagElements[i].className.match("seqno"))
            tagElements[i].innerHTML = seq++;
    }

    // id/name ふり直し
    var tagElements = document.getElementsByTagName("input");
    if (!tagElements)
        return false;

    // <input type="text" id="txtN">
    var seq = 1;
    for (var i = 0; i < tagElements.length; i++)
    {
        if (tagElements[i].className.match("inpval"))
        {
            tagElements[i].setAttribute("id", "txt" + seq);
            tagElements[i].setAttribute("name", "txt" + seq);
            ++seq;
        }
    }

    // <input type="button" id="delBtnN">
    seq = 1;
    for (var i = 0; i < tagElements.length; i++)
    {
        if (tagElements[i].className.match("delbtn"))
        {
            tagElements[i].setAttribute("id", "delBtn" + seq);
            ++seq;
        }
    }
}

