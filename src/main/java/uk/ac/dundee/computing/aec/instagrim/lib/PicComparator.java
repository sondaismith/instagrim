/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.lib;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;
import java.util.Comparator;

/**
 *
 * @author NeXType
 */
public class PicComparator implements Comparator<Pic> {
    @Override
    public int compare(Pic o1, Pic o2) {
        if(o1.getDateUploaded().before(o2.getDateUploaded())) return -1;
        if(o1.getDateUploaded() == o2.getDateUploaded()) return 0;
        return 1;
    }
}
