
package com.employeeClient.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import com.employeeClient.bean.ChangePass;
import com.employeeClient.bean.Charges;
import com.employeeClient.bean.ClientDetails;
import com.employeeClient.bean.CreateCard;
import com.employeeClient.bean.Creds;
import com.employeeClient.bean.TransactionSpring;
import com.employeeClient.bean.WalletSpring;

@Controller
public class ClientController {
	WalletSpring w1;
	Creds c;
	@RequestMapping("/homeb")
	public String index(HttpSession ses)
	{
		System.out.println("Index");
		return "welcome";
	}
	@RequestMapping("/homeA")
	public String indexAdmin(HttpSession ses)
	{
		System.out.println("Index");
		return "adminWelcome";
	}
	@RequestMapping("/login")
	public String login(HttpSession ses)
	{
		ses.invalidate();
		return "login";
	}
	@RequestMapping("/adding")
	public String addcharge(HttpSession ses)
	{
		return "addcharge";
	}
	@RequestMapping("/add")
	public String add()
	{
		return "addpage";
	}
	@RequestMapping("/withdraw")
	public String withdpage()
	{
		return "withdp";
	}
	
	@RequestMapping("deposit")
	public String depositpage()
	{
		return "depp";
	}
	
	@RequestMapping("/fundtransfer")
	public String fundTransfer()
	{
		return "ft";
	}
	@RequestMapping("/changepa")
	public String transac()
	{
		return "changepas";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession ses)
	{
		ses.invalidate();
		return "logout";
	}
	@RequestMapping("/alogin")
	public String aalogin(HttpSession ses)
	{
		ses.invalidate();
		return "Adminlogin";
	}
	@RequestMapping("/addA")
	public String adminAdd()
	{
		return "addadminpage";
	}
	@RequestMapping("/clientadds")
	public String clientadd()
	{
		return "clientadd";
	}
	
	
	/*@RequestMapping("adminLogin")
	public String adminHome(@RequestParam("t1") String uid,@RequestParam("t2") String pass,HttpSession ses,Model m)
	{
		c=new Creds(uid, pass);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/login";
		Creds li=rt.postForObject(uri, c, Creds.class);
		if(li!=null)
		{
		ses.setAttribute("user",li);
		ses.setMaxInactiveInterval(3000);
		return "adminWelcome";
		}
		else
			m.addAttribute("empList","Password Or User Name Incorrect");
			return "login";
	}
	
	*/
	
	/*@RequestMapping("home")
	public String getHome(Model m)
	{
		String uri="http://localhost:8080/SpringRestExaple/employeemain";
		RestTemplate rt=new RestTemplate();
		String mess=rt.getForObject(uri, String.class);
		System.out.println("output========="+mess);
		m.addAttribute("empList",mess);
		return "index";
	}*/
	@RequestMapping("passwordCreation")
	public String addPassword(Creds c, Model m, HttpServletRequest req)
	{
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/employee/password";
		String li = rt.postForObject(uri,c,String.class);
		m.addAttribute("message",li);
		return "password";
	}
	@RequestMapping("create")
	public String addCustomer(WalletSpring w, Model m,HttpServletRequest req,HttpSession ses)
	{
		System.out.println("============"+req.getRemoteAddr());
		RestTemplate rt=new RestTemplate();
		WalletSpring w2= new WalletSpring();
		w2=w;
		String uri="http://localhost:8080/SpringRestExaple/employee/create";
		String li=rt.postForObject(uri,w,String.class);
		String li2="sucess";
		if(li.equals(w2.getUser_name()))
		{
			System.out.println("Inside If");
		ses.setAttribute("user", w2);
		return "password";
		}
		else
		{
			System.out.println(li);
			m.addAttribute("message",w2.getUser_name());
			return "addpage";
		}
	}
	@RequestMapping("Login")
	public String login(@RequestParam("t1") String uid,@RequestParam("t2") String pass,HttpSession ses,Model m)
	{
		c=new Creds(uid, pass);
		RestTemplate rt=new RestTemplate();
		System.out.println("Before calling service");
		String uri="http://localhost:8080/SpringRestExaple/employee/login";
		WalletSpring li=rt.postForObject(uri, c, WalletSpring.class);
		System.out.println("After calling service");
		if(li!=null)
		{
		ses.setAttribute("user",li);
		ses.setMaxInactiveInterval(3000);
		return "welcome";
		}
		else
			m.addAttribute("empList","Password Or User Name Incorrect, Please use User Login for user creds");
			return "login";
	}
	@RequestMapping("showbalance")
	public String showBalance(@RequestParam("t1") String w,Model m)
	{
		w1=new WalletSpring(w);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/employee/show";
		String ans=rt.postForObject(uri, w1, String.class);
		m.addAttribute("messageB",ans);
		return "welcome";
	}
	@RequestMapping("withdraw1")
	public String withdraw(@RequestParam("t1") String uid,@RequestParam("t2") double money,Model m)
	{
		w1=new WalletSpring(money, uid);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/employee/withdraw";
		String li=rt.postForObject(uri, w1, String.class);
		m.addAttribute("message",li);
		return "withdp";
	}
	@RequestMapping("deposit1")
	public String deposit(@RequestParam("t1") String uid,@RequestParam("t2") double money,Model m)
	{
		w1=new WalletSpring(money, uid);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/employee/deposit";
		String li=rt.postForObject(uri, w1, String.class);
		m.addAttribute("message",li);
		return "depp";
	}
	@RequestMapping("fundtransfer1" )
	public String fundTransfer(@RequestParam("t1") String uid,@RequestParam("t2") long account,@RequestParam("t3") double money,Model m)
	{
		String li1="";
		w1=new WalletSpring(money, uid, account);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/employee/ft";
		String li=rt.postForObject(uri, w1, String.class);
		if(li!=null)
		{
			li1="Transfered Sucessfully At "+li;
		}
		m.addAttribute("message",li1);
		return "ft";
	}
	@RequestMapping("changepass")
	public String changePass(@RequestParam("t1") String oldpass,@RequestParam("t2") String newpass,@RequestParam("t3") String user,Model m)
	{
		ChangePass c=new ChangePass(user, oldpass, newpass);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/employee/changepass";
		String li=rt.postForObject(uri, c, String.class);
		m.addAttribute("message1",li);
		return "changepas";
	}
	@RequestMapping("transactions")
	public String transactions(@RequestParam("t1") String userName,Model m, HttpSession ses)
	{
		w1=new WalletSpring(userName);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/employee/trans";
		List<TransactionSpring> li=rt.postForObject(uri, w1, List.class);
		//System.out.println(li);
		//ses.setAttribute("trans", li);
		m.addAttribute("trans", li);
		
		return "transactions";
	}
	@RequestMapping("apply")
	public String createCard(@RequestParam("t1") String user,@RequestParam("t2") String name,Model m)
	{
		CreateCard c=new CreateCard(name, user);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/employee/apply";
		String li=rt.postForObject(uri, c, String.class);
		m.addAttribute("messageD",li);
		return "welcome";
	}
	@RequestMapping("/adminLogin")
	public String adminHome(@RequestParam("t1") String uid,@RequestParam("t2") String pass,HttpSession ses,Model m)
	{
		c=new Creds(uid, pass);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/login";
		Creds li=rt.postForObject(uri, c, Creds.class);
		if(li!=null)
		{
		ses.setAttribute("user",li);
		ses.setMaxInactiveInterval(3000);
		return "adminWelcome";
		}
		else
			m.addAttribute("empList","Password Or User Name Incorrect, Please use admin login to use Admin creds");
			return "login";
	}
	
	@RequestMapping("/adminUser")
	public String adminUsersShow(@RequestParam("t1") String userName,Model m)
	{
		Creds c = new Creds();
		c.setUserName(userName);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/usersCreds";
		List<Creds> li=rt.postForObject(uri, c, List.class);
		//System.out.println(li);
		//ses.setAttribute("trans", li);
		m.addAttribute("users", li);
		
		return "AdminUsers";
	}
	
	@RequestMapping("/addAdmin")
	public String addCustomer(Creds c, Model m,HttpServletRequest req,HttpSession ses)
	{
		System.out.println("============"+req.getRemoteAddr());
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/addAdmin";
		String li=rt.postForObject(uri,c,String.class);
		m.addAttribute("message",li);
		return "addadminpage";
	}
	@RequestMapping("/editCredUsers")
	public String adminCredUsers(@RequestParam("t1") String userName, Model m,HttpServletRequest req)
	{
		Creds c=new Creds();
		c.setUserName(userName);
		System.out.println("============"+req.getRemoteAddr());
		System.out.println(c.getUserName());
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/retrieveUser";
		Creds li=rt.postForObject(uri,c,Creds.class);
		System.out.println(li);
		m.addAttribute("user",li);
		return "admineditusers";
	}
	@RequestMapping("/editCredUsersSubmit")
	public String editCredSubmit(Creds c, Model m,HttpSession ses,HttpServletRequest req)
	{
		RestTemplate rt=new RestTemplate();
		System.out.println("Client - edit cred -");
		System.out.println(c.getUserName());
		String uri="http://localhost:8080/SpringRestExaple/admin/editCredUsers";
		String li=rt.postForObject(uri,c,String.class);
		m.addAttribute("message",li);
		return "admineditusers";
	}
	@RequestMapping("/deleteCredUsers")
	public String deleteCredSubmit(@RequestParam("t1") String userName, Model m,HttpSession ses,HttpServletRequest req)
	{
		System.out.println("Inside delete");
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/deleteCredUsers";
		String li=rt.postForObject(uri,userName,String.class);
		System.out.println("after client delete");
		m.addAttribute("message",li);
		return "AdminUsers";
	}
	@RequestMapping("/editUsers")
	public String retrieveUser(@RequestParam("t1") String userName, Model m,HttpServletRequest req)
	{
		WalletSpring c=new WalletSpring();
		c.setUser_name(userName);
		System.out.println("============"+req.getRemoteAddr());
		System.out.println(userName);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/retrieveUserEdit";
		WalletSpring li=rt.postForObject(uri,c,WalletSpring.class);
		m.addAttribute("user",li);
		return "editusersadmin";
	}
	@RequestMapping("/editUsersSubmit")
	public String editUserSubmit(WalletSpring c, Model m,HttpSession ses,HttpServletRequest req)
	{
		RestTemplate rt=new RestTemplate();
		System.out.println("Client - edit cred -");
		System.out.println(c.getUser_name());
		String uri="http://localhost:8080/SpringRestExaple/admin/editUsers";
		String li=rt.postForObject(uri,c,String.class);
		m.addAttribute("message",li);
		return "editusersadmin";
	}
	@RequestMapping("/deleteUser")
	public String deleteUserSubmit(@RequestParam("t1") String userName, Model m,HttpSession ses,HttpServletRequest req)
	{
		System.out.println("Inside delete");
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/deleteUsers";
		String li=rt.postForObject(uri,userName,String.class);
		System.out.println("after client delete");
		m.addAttribute("message",li);
		return "adminWalletUsers";
	}
	@RequestMapping("/adminWalletUserShow")
	public String adminWalletUsersShow(@RequestParam("t1") String userName,Model m)
	{
		WalletSpring c = new WalletSpring();
		c.setUser_name(userName);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/users";
		List<WalletSpring> li=rt.postForObject(uri, c, List.class);
		System.out.print(li);
		m.addAttribute("users", li);
		
		return "adminWalletUsers";
	}
	@RequestMapping("/showcards")
	public String showCreditCard(@RequestParam("t1") String userName,Model m)
	{
		WalletSpring c = new WalletSpring();
		c.setUser_name(userName);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/carddetails";
		List<CreateCard> li=rt.postForObject(uri, c, List.class);
		System.out.print(li);
		m.addAttribute("users", li);
		
		return "carddetails";
	}
	@RequestMapping("/showcard")
	public String showCard(@RequestParam("t1") String userName,Model m)
	{
		WalletSpring c = new WalletSpring();
		c.setUser_name(userName);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/usercard";
		List<CreateCard> li=rt.postForObject(uri, c, List.class);
		System.out.print(li);
		m.addAttribute("users", li);
		
		return "carddetailuser";
	}
	@RequestMapping("/editcard")
	public String editUserCard(@RequestParam("t1") String userName,@RequestParam("t1") String name,Model m)
	{
		CreateCard card = new CreateCard();
		card.setCust_id(userName);
		card.setCardname(name);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/editcard";
		String li=rt.postForObject(uri, card, String.class);
		m.addAttribute("user", li);
		
		return "carddetails";
	}
	/*@RequestMapping("/editcardsubmit")
	public String cardSubmit(CreateCard card,Model m)
	{
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/editcardsubmit";
		String li=rt.postForObject(uri, card, String.class);
		m.addAttribute("message", li);
		return "editcarduser";
	}*/
	@RequestMapping("/deletecard")
	public String deleteUserCard(@RequestParam("t1") String userName,Model m)
	{
		CreateCard card = new CreateCard();
		card.setCust_id(userName);
		System.out.println(card.getCust_id());
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/deletecard";
		String li=rt.postForObject(uri, card, String.class);
		System.out.print(li);
		m.addAttribute("message", li);
		
		return "carddetails";
	}
	@RequestMapping("/charges")
	public String showCharges(@RequestParam("t1") String uid, Model m)
	{
		Charges ch=new Charges();
		ch.setTranstype(uid);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/charges";
		List<Charges> li=rt.postForObject(uri, ch, List.class);
		m.addAttribute("users", li);
		return "viewcharges";
	}
	@RequestMapping("/editcharge")
	public String editCharges(@RequestParam("t1") String uid, Model m)
	{
		Charges ch=new Charges();
		ch.setTranstype(uid);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/editcharge";
		Charges li=rt.postForObject(uri, ch, Charges.class);
		m.addAttribute("user", li);
		return "editcharges";
	}
	@RequestMapping("/editchargesubmit")
	public String commitCharges(Charges ch, Model m)
	{
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/editchargesubmit";
		String li=rt.postForObject(uri, ch, String.class);
		m.addAttribute("message", li);
		return "editcharges";
	}
	@RequestMapping("/addchargemethod")
	public String addCharges(Charges charge, Model m)
	{
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/addcharge";
		String li=rt.postForObject(uri, charge, String.class);
		m.addAttribute("message", li);
		return "addcharge";
	}
	@RequestMapping("/deletecharge")
	public String deleteCharges(@RequestParam("t1") String uid, Model m)
	{
		Charges ch=new Charges();
		ch.setTranstype(uid);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/deletecharge";
		String li=rt.postForObject(uri, ch, String.class);
		m.addAttribute("message", li);
		return "addcharge";
	}
	@RequestMapping("/runcharge")
	public String exeCharges(@RequestParam("t1") String uid, Model m)
	{
		Creds c= new Creds();
		c.setUserName(uid);
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/execharges";
		String li=rt.postForObject(uri, c, String.class);
		m.addAttribute("message", li);
		return "viewcharges";
	}
	@RequestMapping("/addingClient")
	public String addClients(ClientDetails cl, Model m)
	{
		System.out.println(cl.getIp());
		System.out.println(cl.getName());
		System.out.println(cl.getAccess());
		RestTemplate rt=new RestTemplate();
		String uri="http://localhost:8080/SpringRestExaple/admin/addclient";
		String li=rt.postForObject(uri, cl, String.class);
		m.addAttribute("message", li);
		return "clientadd";
	}
	
}
