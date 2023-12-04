package dao;

import java.util.List;

import entities.Ville;
import jakarta.ejb.Local;

@Local
public interface IDaoLocale <T> {
	
	public T create(T o);
	public boolean delete(T o);
	public boolean deleteById(int id);
	public T update(T o);
	public Ville findById(int id);
	public List<T> findAll();

}
