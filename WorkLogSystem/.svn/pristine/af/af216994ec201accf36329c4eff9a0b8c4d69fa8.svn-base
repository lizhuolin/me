package com.poobo.core.entity;



/**
 * TblUserRoleId entity. @author MyEclipse Persistence Tools
 */

public class TblUserRoleId  implements java.io.Serializable {


    // Fields    

     private TblUser tblUser;
     private TblRole tblRole;


    // Constructors

    /** default constructor */
    public TblUserRoleId() {
    }

    
    /** full constructor */
    public TblUserRoleId(TblUser tblUser, TblRole tblRole) {
        this.tblUser = tblUser;
        this.tblRole = tblRole;
    }

   
    // Property accessors


    public TblRole getTblRole() {
        return this.tblRole;
    }
    
    public TblUser getTblUser() {
		return tblUser;
	}


	public void setTblUser(TblUser tblUser) {
		this.tblUser = tblUser;
	}


	public void setTblRole(TblRole tblRole) {
        this.tblRole = tblRole;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof TblUserRoleId) ) return false;
		 TblUserRoleId castOther = ( TblUserRoleId ) other; 
         
		 return ( (this.getTblUser()==castOther.getTblUser()) || ( this.getTblUser()!=null && castOther.getTblUser()!=null && this.getTblUser().equals(castOther.getTblUser()) ) )
 && ( (this.getTblRole()==castOther.getTblRole()) || ( this.getTblRole()!=null && castOther.getTblRole()!=null && this.getTblRole().equals(castOther.getTblRole()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getTblUser() == null ? 0 : this.getTblUser().hashCode() );
         result = 37 * result + ( getTblRole() == null ? 0 : this.getTblRole().hashCode() );
         return result;
   }   





}