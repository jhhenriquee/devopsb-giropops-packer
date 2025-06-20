# Makefile para automação do build Packer

.PHONY: all clean install packer-build validate

all: install packer-build

# Instala dependências
install:
	@echo "Instalando dependências..."
	sudo apt-get update && sudo apt-get install -y \
		make \
		packer \
		ansible \
		git
	
	@echo "Instalando roles Ansible..."
	mkdir -p ansible/roles
	ansible-galaxy install -r ansible/requirements.yml --force

# Valida configuração Packer
validate:
	@echo "Validando templates Packer..."
	packer validate .

# Executa build Packer
packer-build: validate
	@echo "Iniciando build da AMI..."
	packer build .

# Limpa arquivos temporários
clean:
	@echo "Limpando arquivos temporários..."
	rm -rf ansible/roles/
	rm -f *.log

# Help
help:
	@echo "Comandos disponíveis:"
	@echo "  make all        - Instala dependências e executa o build completo"
	@echo "  make install    - Instala apenas as dependências"
	@echo "  make validate   - Valida os templates Packer"
	@echo "  make packer-build - Executa o build Packer"
	@echo "  make clean      - Limpa arquivos temporários"
