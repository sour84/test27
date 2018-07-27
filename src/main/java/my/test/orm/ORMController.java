package my.test.orm;

//import org.osgi.service.useradmin.User;
import my.test.entity.ContactEntity;
import my.test.intf.ContactService;
import my.test.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created for JavaStudy.ru on 28.02.2016.
 */
@ManagedBean
@ViewScoped
@Controller
public class ORMController {
@Autowired
    private ContactService contactService;


    @RequestMapping(value = "/queryFindAllUsersJPA", method = RequestMethod.GET)
    public ModelAndView queryFindAllUsersJPA() {
        System.out.println("ORMController ormFindAllUsers is called");
        List<ContactEntity> contact = contactService.findAll();
        return new ModelAndView("/orm/contact_list", "resultObject", contact);

    }
    @RequestMapping(value = "/newContact", method = RequestMethod.GET)
    public ModelAndView newContact(ModelAndView model) {
        ContactEntity contactEntity = new ContactEntity();
        model.addObject("contactEntity", contactEntity);
        model.setViewName("/orm/new-employee");
        return model;
    }

    @RequestMapping(value = "/saveContact", method = RequestMethod.POST)
    public ModelAndView saveContact(@ModelAttribute ContactEntity contactEntity) {
         contactService.save(contactEntity);
         return queryFindAllUsersJPA();
    }
    @RequestMapping(value = "/deleteContact", method = RequestMethod.GET)
    public ModelAndView deleteContact(HttpServletRequest request) {
        int contactId = Integer.parseInt(request.getParameter("id"));
        contactService.delete(contactId);
        return queryFindAllUsersJPA();
        //return new ModelAndView("redirect:/orm/person");
    }

   @RequestMapping(value = "/editEmployee", method = RequestMethod.GET)
   public ModelAndView editArticle(HttpServletRequest request) {
       int contactId = Integer.parseInt(request.getParameter("id"));
       ModelAndView model = new ModelAndView();
       ContactEntity contactEntity = contactService.findOne(contactId);
       model.addObject("contactEntity", contactEntity);
       model.setViewName("/orm/personAdd");
       return model;
   }
}