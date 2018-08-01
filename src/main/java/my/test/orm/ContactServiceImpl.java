package my.test.orm;
import my.test.entity.ContactEntity;
import my.test.intf.ContactService;
import my.test.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import org.springframework.data.domain.Sort;


@Repository
@Transactional (value = "seaTxManager")
public class ContactServiceImpl implements ContactService {

    @Autowired
    ContactRepository contactRepository;


    @Override
    public List<ContactEntity> findByLastName(String lastName) {
        return contactRepository.findByLastName(lastName);
    }

    public List<ContactEntity> findAll() {
        return contactRepository.findAll(sortByIdAsc());
    }

    public ContactEntity save(ContactEntity contact) {
        return contactRepository.saveAndFlush(contact);
    }

    @Override
    public ContactEntity delete(Integer id) {
        ContactEntity contactEntity = contactRepository.findById(id).get();
        contactRepository.delete(contactEntity);
        return contactEntity;
    }

    @Override
    public ContactEntity findById(int id) {

        return contactRepository.findById(id).get();
    }



    private Sort sortByIdAsc() {
        return new Sort(Sort.Direction.ASC, "firstName");
    }
}

