class Family:

	def __init__(self, idx):
		self._child_id = []
		self._id = idx
		self._husb_id = None
		self._wife_id = None
	
	def husb(self, idx):
		self._husb_id = idx
	
	def wife(self, idx):
		self._wife_id = idx

	def children(self, idx):
		self._child_id.append(idx)
	
	@property
	def child_id(self):
		return self._child_id
	
	@property
	def husb_id(self):
		return self._husb_id
	
	@property
	def wife_id(self):
		return self._wife_id


class Person:

	def __init__(self, idx, name, surname, sex):
		self._id = idx
		self._name = name
		self._surname = surname
		self._sex = sex

	def get_full_name(self):
		return self._surname + ' ' + self._name

	def __str__(self):
		return self._name

	@property
	def sex(self):
		return self._sex


def ged_to_prolog(file_name):
	persons = {}
	families = {}
	person_id = None
	person_name = None
	person_surname = None
	person_sex = None
	fam_idx = None
	with  open(file_name, 'r') as f:
		for line in f:
			if 'INDI' in line:
				person_id = line.split()[1]
			elif 'NAME' in line:
				arr = line.split()
				person_name = arr[2]
			elif 'SURN' in line:
				person_surname = line.split()[2]
			elif 'SEX' in line:
				person_sex = line.split()[2]
				persons[person_id] = (Person(
					person_id,
					person_name,
					person_surname,
					person_sex
					))
			elif 'FAM\n' in line:
				families[line.split()[1]] = Family(line.split()[1])
				fam_idx = line.split()[1]
			elif 'HUSB' in line:
				families[fam_idx].husb(line.split()[2])
			elif 'WIFE' in line:
				families[fam_idx].wife(line.split()[2])
			elif 'CHIL' in line:
				families[fam_idx].children(line.split()[2])
	return persons, families


def get_man_chil(families, persons):
	for key in families:
		for child in families[key].child_id:
			if families[key].husb_id:
				print('father(\'{}\', \'{}\')'.format(
				persons[families[key].husb_id].get_full_name(),
				persons[child].get_full_name()))
			if families[key].wife_id:
				print('mother(\'{}\', \'{}\')'.format(
				persons[families[key].wife_id].get_full_name(),
				persons[child].get_full_name()))


def main():
	persons, families = ged_to_prolog('tree.ged')
	get_man_chil(families, persons)


if __name__ == '__main__':
	main()
