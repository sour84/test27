package my.test.orm;

//import org.osgi.service.useradmin.User;
import my.test.entity.ContactEntity;
import my.test.intf.ContactService;
import my.test.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
        List<ContactEntity> contact = contactService.findAll();
        return new ModelAndView("/orm/person", "resultObject", contact);

    }

    @RequestMapping(value ="/result", method = RequestMethod.POST)
    public ModelAndView result(@ModelAttribute("lastName")String lastName){
        List<ContactEntity> contact= contactService.findByLastName(lastName);
        return new ModelAndView("/orm/person", "resultObject", contact);
    }

    @RequestMapping(value = "/newContact", method = RequestMethod.GET)
    public ModelAndView newContact(ModelAndView model) {
        ContactEntity contactEntity = new ContactEntity();
        model.addObject("contactEntity", contactEntity);
        model.setViewName("/orm/new-employee");
        return model;
    }

    @RequestMapping(value = "/saveContact", method = RequestMethod.POST)
    public ModelAndView saveEmployee(@ModelAttribute ContactEntity contactEntity) {
     contactService.save(contactEntity);
     return queryFindAllUsersJPA();
    }
    @RequestMapping(value = "/deleteContact", method = RequestMethod.POST)
    public ModelAndView deleteContact(HttpServletRequest request) {
        int contactId = Integer.parseInt(request.getParameter("id"));
        contactService.delete(contactId);
        return queryFindAllUsersJPA();
    }

   @RequestMapping(value = "/edit", method = RequestMethod.POST)
   public ModelAndView editArticle(HttpServletRequest request) {
       int contactId = Integer.parseInt(request.getParameter("id"));
       ModelAndView model = new ModelAndView();
       ContactEntity contactEntity = contactService.findById(contactId);
       model.addObject("contactEntity", contactEntity);
       model.setViewName("/orm/new-employee");
       return model;
   }


}